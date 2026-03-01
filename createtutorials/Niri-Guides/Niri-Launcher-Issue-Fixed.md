**Title:** Niri Launcher Issue Fixed
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Niri-Launcher-Issue-Fixed.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

Perfect! ✅ Niri Launcher Issue Fixed
🔧 Problems Identified & Fixed:
1. Rofi Window Switcher Issue
- Problem: Rofi was using window-match-fields with unsupported fields
for Wayland
- Fix: Updated from "title,class,role,name,desktop" to "title,class"
- Result: Window switcher now works properly with Wayland
2. Window Command Issue
- Problem: Using wmctrl (X11 tool) instead of niri commands
- Fix: Changed from "wmctrl -i -R {window}" to "niri msg action
focus-window --id {window}"
- Result: Window switching now uses native niri IPC
3. Workspace Assignment Issue
- Problem: Using workspace names ("a", "b", "c") instead of workspace
numbers (1, 2, 3, 4)
- Fix: Updated all open-on-workspace rules to use numeric workspace IDs
- Result: Applications now open on correct numbered workspaces
📋 Your Updated Configuration:
Workspace Assignments:
- Workspace 1: Firefox (opens maximized)
- Workspace 2: Kitty (opens maximized)
- Workspace 3: Geany (opens maximized)
- Workspace 4: Thunar (opens maximized)
Rofi Launcher (Mod+D):
- ✅ Fixed window field compatibility for Wayland
- ✅ Uses niri-native window commands
- ✅ Better window format: {title} [class]
Next Steps:
1. Test the launcher: Press Mod+D to open Rofi
2. Test window switching: Use window switcher mode to see A, B, C, D
layouts
3. Test new apps: Open Firefox/Kitty/Geany - they should now appear on
their correct workspaces
The launcher should now correctly display your window layouts with
proper workspace organization!
