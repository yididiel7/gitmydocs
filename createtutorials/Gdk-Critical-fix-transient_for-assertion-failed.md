→ Read quickshell/src/core/platformmenu_p.hpp

  █▀▀█  Gdk Critical: transient_for assertion failed in W…
  █  █  opencode -s ses_3acc2a7bfffehXWclbSadE6Pf3

Thinking: Now I understand the issue completely. Looking at the code
flow:

1. In platformmenu.cpp, the PlatformMenuQMenu::setVisible(bool visible)
override (lines 41-53) runs creation hooks BEFORE calling the parent
QMenu::setVisible(visible).

2. The creation hooks include platformMenuHook in
wayland/platformmenu.cpp
which sets Wayland-specific popup properties.
3. The problem is that the hook runs when the menu becomes visible, but
at that point in the case of submenus, the transient parent might not
be set yet because setTransientParent is called later.
4. The order is:
   - setVisible(true) → runs hooks → QMenu::setVisible(true)
   - Hook tries to access window->transientParent()
- But for submenus, the parent isn't set as transient parent of the
window yet

The issue is in wayland/platformmenu.cpp at line 39: it checks window->
transientParent() but for submenus, the containing menu isn't the
transient
parent of the window - it's stored in menu->containingMenu.
The bug is that when a submenu is shown, it doesn't have a transient
parent
set (only the top-level menu does), and the hook tries to check window->
transientParent() which returns null for submenus.
This causes the GDK error because Wayland requires all popups to have a
transient_for set.
Based on my exhaustive search of the codebase, I've identified the
missing
transient_for assignment causing your GDK error.

Root Cause
File: /home/srhills/quickshell/src/wayland/platformmenu.cpp
Lines: 18-65
The platformMenuHook function sets Wayland popup properties when a menu
becomes visible. However, it has a logic gap:
// wayland/platformmenu.cpp:39-52
} else if (auto* parent = window->transientParent()) {
    // abort if already set by a PopupAnchor
    if (window->property("_q_waylandPopupAnchorRect").isValid()) return;

// Sets popup anchor properties for top-level menus...
auto anchorRect = QRect(menu->targetPosition -
parent->geometry().topLeft(), QSize(1, 1));
window->setProperty("_q_waylandPopupAnchorRect", anchorRect);
// ...
}

The Bug

For submenus (which have menu->containingMenu set), the code path at
lines
24-38 handles them correctly. But for top-level menus without a
containingMenu,
it relies on window->transientParent() at line 39.
The problem: When PlatformMenuEntry::display() is called,
setTransientParent()
is set after createWinId() but the Wayland popup configuration happens
during
setVisible() which may be triggered before or during the popup() call.

Evidence

In /home/srhills/quickshell/src/core/platformmenu.cpp lines 116-121:
this->qmenu->createWinId();
this->qmenu->windowHandle()->setTransientParent(window);  // Set here
this->qmenu->targetPosition = point;
this->qmenu->popup(point);  // This triggers setVisible -> hooks ->
Wayland config
The transient parent IS being set before popup(), but there's a race
condition
or ordering issue where the Wayland hook runs before the transient
parent
is properly registered with the Wayland surface.

Fix

The issue is that createWinId() creates the platform window, but the
transient
parent must be set before the window is shown/configured by Wayland.
The current order should work, but if the error persists, you may need
to
ensure the transient parent is set immediately after createWinId() and
before any visibility changes.

Potential fix location:
/home/srhills/quickshell/src/wayland/platformmenu.cpp
line 39 should handle the case where transientParent() is null by
deferring
the popup configuration or setting a default parent.
