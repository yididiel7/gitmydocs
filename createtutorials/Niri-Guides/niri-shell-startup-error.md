**Title:** Niri Shell Startup Error
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** niri-shell-startup-error.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

niri Shell startup error: /bin/sh line 1: tuigreet:
nopencode -s ses_3c875b4faffeS3aQ5Bx3iW02ppo


Niri Logout error: import-environment without var name…
opencode -s ses_3c85fe988ffeGJ7SskbY05dwsT

I found the issue. Looking at your config files:
The Problem:
In config.bak.kdl (lines 137-138), there's a typo:
spawn-at-startup "systemctl" "--usr" "import-environment"
"WAYLAND_DISPLAY" "XDG_CURRENT_DESKTOP"
The --usr should be --user. Also there's a typo: WAYLAND_-DISPLAY (extra
underscore).
But more importantly, this syntax with spawn-at-startup (separate
arguments) is different from spawn-sh-at-startup (shell command).
In your current config.kdl, lines 127-128 are correct:
spawn-sh-at-startup "systemctl --user import-environment WAYLAND_DISPLAY
XDG_CURRENT_DESKTOP WAYLAND_SOCKET=wayland-output"
spawn-sh-at-startup "dbus-update-activation-environment --systemd
WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=niri"
However, the deprecation warning likely comes from somewhere else. Check
for:
1. Shell logout scripts:
cat ~/.bash_logout 2>/dev/null || echo "No .bash_logout"
cat ~/.zlogout 2>/dev/null || echo "No .zlogout"
2. Systemd user session stop scripts:
ls -la ~/.config/systemd/user/ 2>/dev/null
3. The typo WAYLAND_SOCKET=wayland-output in config.kdl line 127 - this
might be parsed incorrectly. Try removing the =wayland-output part:
spawn-sh-at-startup "systemctl --user import-environment WAYLAND_DISPLAY
XDG_CURRENT_DESKTOP WAYLAND_SOCKET"
The systemctl import-environment command expects just variable names,
not VAR=value syntax. That could be causing the parsing issue.
Would you like me to fix the config.kdl file?
▣  Sisyphus · kimi-k2.5-free · 22.3s
yes
Thinking: The user wants me to fix the config.kdl file. Looking at line
127, there's an issue with the syntax:
spawn-sh-at-startup "systemctl --user import-environment WAYLAND_DISPLAY
XDG_CURRENT_DESKTOP WAYLAND_SOCKET=wayland-output"
The problem is WAYLAND_SOCKET=wayland-output - systemctl
import-environment expects just variable names, not VAR=value syntax.
This is likely causing the deprecation warning.
I should change it to just WAYLAND_SOCKET to match the pattern of the
other variables.
Let me provide a clear summary to the user.
Fixed. The issue was on line 127:
Before:
spawn-sh-at-startup "systemctl --user import-environment WAYLAND_DISPLAY
XDG_CURRENT_DESKTOP WAYLAND_SOCKET=wayland-output"
After:
spawn-sh-at-startup "systemctl --user import-environment WAYLAND_DISPLAY
XDG_CURRENT_DESKTOP WAYLAND_SOCKET"
The systemctl import-environment command expects just variable names,
not VAR=value syntax. The =wayland-output part was being misinterpreted,
causing systemd to think you were calling it without a proper variable
list.
Next time you log out of niri, the deprecation warning should be gone.

Window-rules enable

// Workspace "b" - Kitty
window-rule {
    match app-id=r"Kitty"
    open-on-workspace "b"
    open-maximized true
}

// Workspace "a" - Geany
window-rule {
    match app-id=r"Geany"
    open-on-workspace "c"
    open-maximized true
}

// Workspace "d" - Thunar
window-rule {
    match app-id=r"Thunar"
    open-on-workspace "d"
    open-maximized true
}

vconsole font issue in niri-session boot
opencode -s ses_3c807c437ffesergziIcIAbIu5

✅ Plymouth Removed from Initramfs
Changes Made
1. Updated /etc/mkinitcpio.conf:
# BEFORE:
HOOKS=(base udev autodetect microcode kms modconf block keyboard keymap
consolefont plymouth filesystems fsck)
# AFTER:
HOOKS=(base udev autodetect microcode kms modconf block keyboard keymap
consolefont filesystems fsck)
2. Rebuilt initramfs:
-> Running build hook: [consolefont]  ✅
-> Running build hook: [filesystems]
-> Running build hook: [fsck]
- ❌ No [plymouth] hook - successfully removed
- ✅ Console font still loading in early boot
3. Results:
- 0 Plymouth files in initramfs (was 100+ files)
- 15MB initramfs size (was 19MB - saved 4MB)
- consolefont.psfu still embedded and loading
⚠️ One More Step Required
You also need to remove splash from your kernel parameters so boot
messages are visible:
Current boot parameters:
quiet splash loglevel=3 vt.global_cursor_default=0 splash
Recommended changes:
- Remove: splash (appears twice in your config!)
- Remove: quiet
- Remove: vt.global_cursor_default=0
- Keep or set: loglevel=4 (or higher to see normal boot messages)
How to change:
- If using systemd-boot: Edit /boot/loader/entries/*.conf
- If using GRUB: Edit /etc/default/grub then run sudo grub-mkconfig -o
/boot/grub/grub.cfg
🎯 After Reboot
Your console font (default8x16) will now be visible during the entire
boot process since:
1. ✅ Plymouth is removed from initramfs
2. ✅ Console font loads early in initramfs
3. ✅ No graphical splash covering the console (once splash is removed
from kernel params)
▣  Sisyphus · kimi-k2.5-free · 1m 20s

Opencode model not found error analysis
opencode -s ses_3c7f91acbffe5Ev48TajUnv4tB

Resume this session with copilot
--resume=30db67ad-822f-474f-8696-00da02a2c8a2
