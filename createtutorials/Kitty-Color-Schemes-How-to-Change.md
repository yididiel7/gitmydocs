How to Change Kitty Color Schemes

Kitty-Color-Schemes-How-to-Change.md
Based on my analysis of your current setup and comprehensive research,
here are all the methods
to change Kitty color schemes:

Current Setup Analysis
Your current configuration structure:
- Main config: /home/srhills/.config/kitty/kitty.conf (includes
colors.conf)
- Active colors: /home/srhills/.config/kitty/colors.conf
- Available themes: dank-theme.conf, dark-theme.auto.conf
- Themes kitten: Available and functional

---

Method 1: Using Themes Kitten (Recommended)
Interactive Theme Selection
kitten themes
- Browse and preview themes interactively
- Search functionality included
- Auto-applies to current session

Direct Theme Application

kitten themes --reload-in=all "ThemeName"

Current Available Themes
You can check what themes are available by running the interactive mode.
Popular built-in themes include:
- Catppuccin variants
- Dracula
- Gruvbox
- Monokai
- Solarized variants
---
Method 2: Manual Configuration Files
Current File Structure
Your current setup uses modular configuration:
colors.conf (currently active):
background #1E2128
foreground #ABB2BF
selection_background #ABB2BF
selection_foreground #1E2128
cursor #ABB2BF
# ... 16 color palette
Alternative Themes Available
Switch to dank-theme:
# Edit kitty.conf, change line 11:
include dank-theme.conf
Switch to dark-theme.auto:
# Edit kitty.conf, change line 11:
include dark-theme.auto.conf

---

Method 3: Create Custom Color Schemes
Option A: Separate Color File
Create /home/srhills/.config/kitty/my-theme.conf:
# Basic colors
background #1a1b26
foreground #c0caf5
# Selection colors
selection_background #33467c
selection_foreground #c0caf5
# Cursor
cursor #c0caf5
cursor_text_color #1a1b26
# 16-color palette
color0 #414868
color1 #f7768e
color2 #9ece6a
color3 #e0af68
color4 #7aa2f7
color5 #bb9af7
color6 #7dcfff
color7 #c0caf5
color8 #414868
color9 #f7768e
color10 #9ece6a
color11 #e0af68
color12 #7aa2f7
color13 #bb9af7
color14 #7dcfff
color15 #d5d6db

Then include it in kitty.conf:
include my-theme.conf
Option B: Theme Management Structure
Organize themes in dedicated directory:
mkdir -p ~/.config/kitty/themes/
# Store themes as themes/my-theme.conf
# Switch by editing include line
include themes/my-theme.conf

---

Method 4: Dynamic Theme Switching Script
Create a theme switcher script:
#!/bin/bash
# ~/.config/kitty/switch-theme.sh
THEME_DIR="$HOME/.config/kitty/themes"
CONFIG_FILE="$HOME/.config/kitty/kitty.conf"
if [ "$1" = "list" ]; then
    ls "$THEME_DIR" | grep '\.conf$'
    exit 0
fi
if [ -z "$1" ]; then
    echo "Usage: $0 <theme-name>|list"
    echo "Available themes:"
    ls "$THEME_DIR" | grep '\.conf$'
    exit 1
fi
THEME_FILE="$THEME_DIR/$1.conf"
if [ ! -f "$THEME_FILE" ]; then
    echo "Theme '$1' not found"
    exit 1
fi
# Update include line
sed -i "s|^include .*.conf|include themes/$1.conf|" "$CONFIG_FILE"
# Reload kitty
kill -USR1 $(pgrep kitty)
Make it executable:
chmod +x ~/.config/kitty/switch-theme.sh
Usage:
# List themes
./switch-theme.sh list
# Switch theme
./switch-theme.sh dark
---
Method 5: Remote Control (Advanced)
Set Colors Dynamically
# Change background color instantly
kitty @ set-colors background="#1a1b26"
# Multiple colors
kitty @ set-colors background="#1a1b26" foreground="#c0caf5"
Create Color Switching Script
#!/bin/bash
# cycle through themes
themes=("light" "dark" "blue")
current_theme=$(kitty @ get-colors | grep "background" | cut -d'#' -f2 |
tail -c6)
# Find next theme
for i in "${!themes[@]}"; do
    if [[ "${themes[$i]}" == "$current_theme" ]]; then
        next_index=$(((i + 1) % ${#themes[@]}))
        break
    fi
done
# Apply next theme
kitty @ set-colors "${themes[$next_index]}"
---
Quick Switch Summary
Easiest: kitten themes (interactive)
Current Setup: Edit kitty.conf include line
Advanced: Create custom themes with dynamic switching
Instant Changes: kitty @ set-colors

Choose the method that fits your workflow best.
The themes kitten approach is recommended for most users as it's
officially supported
and provides immediate visual feedback.
