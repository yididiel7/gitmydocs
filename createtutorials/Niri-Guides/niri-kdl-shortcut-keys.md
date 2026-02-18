**Title:** Niri KDL Shortcut Keys
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** niri-kdl-shortcut-keys.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

// Mod-Shift-/, which is usually the same as Mod-/,
    Mod+Shift+Slash { show-hotkey-overlay; }
Mod+Return hotkey-overlay-title="Open a Terminal: kitty" { spawn
"kitty"; }
Mod+D hotkey-overlay-title="Run an Application: Rofi" { spawn-sh "rofi
-show drun"; }
    Mod+Alt+B { spawn "/opt/firefox/firefox"; }
    Mod+Alt+E { spawn "geany"; }
    Mod+Alt+Y { spawn "thunar"; }
    Mod+Alt+G { spawn "~/wallpaper.sh"; }
    Mod+Alt+W { spawn "atril"; }
    Mod+Alt+K { spawn "alacritty"; }
Mod+Alt+C { spawn "qs" "-c" "noctalia-shell" "ipc" "call" "launcher"
"clipboard"; }
Mod+Alt+U { spawn "qs" "-c" "noctalia-shell" "ipc" "call" "launcher"
"calculator"; }
Mod+Alt+J { spawn "qs" "-c" "noctalia-shell" "ipc" "call" "lockScreen"
"lock"; }
    Mod+O repeat=false { toggle-overview; }
    Mod+Q repeat=false { close-window; }
