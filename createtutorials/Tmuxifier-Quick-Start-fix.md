**Title:** Tmuxifier Quick Start Fix
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Tmuxifier-Quick-Start-fix.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

Tmuxifier Quick Start

Tmuxifier lets you define session and window layouts as shell scripts
for automated tmux setup.




  █▀▀█  Zsh tmuxifier command not found in .zshrc analysis
  █  █  opencode -s ses_3ac37e2f4ffe3B243wnXzoCwGQ
  ▀▀▀▀


Core Commands
# See all available commands
tmuxifier help
# List existing layouts
tmuxifier list
# List only windows or sessions
tmuxifier list-windows
tmuxifier list-sessions
Creating Window Layouts
# Create a new window layout (opens in $EDITOR)
tmuxifier new-window my-dev-window
# Load the window in current tmux session
tmuxifier load-window my-dev-window
# Edit an existing layout
tmuxifier edit-window my-dev-window
Window layout example (~/.tmuxifier/layouts/my-dev-window.window.sh):
window_root "~/projects/myapp"  # Set working directory
new_window "My Dev Window"       # Create window with title
split_v 20                       # Split vertically (20% bottom)
run_cmd "npm run dev"            # Run command in bottom pane
split_h 50                       # Split horizontally (50% right)
run_cmd "nvim"                   # Open editor in right pane
select_pane 0                    # Focus first pane
Creating Session Layouts
# Create a new session layout
tmuxifier new-session my-project
# Load the session
tmuxifier load-session my-project
Session layout example (~/.tmuxifier/layouts/my-project.session.sh):
session_root "~/projects/myapp"
new_session "my-project"
# Load existing window layouts
load_window "editor"
load_window "logs"
# Or define windows inline
new_window "server"
run_cmd "npm start"
Helper Commands Available in Layouts
| Command | Description |
|---------|-------------|
| new_window "name" | Create new window |
| new_session "name" | Create new session |
| split_v [percent] | Split vertically |
| split_h [percent] | Split horizontally |
| run_cmd "command" | Run command in current pane |
| select_pane [index] | Focus specific pane |
| window_root "path" | Set window working directory |
| session_root "path" | Set session working directory |
| load_window "name" | Load existing window layout |
Layout Storage
Layouts are stored in ~/.tmuxifier/layouts/:
- Window layouts: *.window.sh
- Session layouts: *.session.sh
Want me to help you create a specific layout for a project?



  █▀▀█  Zsh tmuxifier command not found in .zshrc analysis
  █  █  opencode -s ses_3ac37e2f4ffe3B243wnXzoCwGQ
  ▀▀▀▀


Done! I've reorganized your ~/.zshrc with proper initialization order. A
backup was created at ~/.zshrc.backup.{timestamp}.
Key Changes
1. Proper Ordering (most important)
✓ Instant prompt (top for performance)
✓ Core environment variables
✓ ALL PATH configuration (consolidated in one place)
✓ Plugin manager (Zinit)
✓ Shell options & history
✓ Completion system
✓ Keybindings
✓ Tool initialization (eval statements - AFTER PATH!)
✓ Aliases & functions
✓ Finalization
2. Fixed Issues
- PATH scattered → Consolidated all PATH exports in one section (lines
35-70)
- tmuxifier PATH before init → .tmuxifier/bin now in PATH before eval
"$(tmuxifier init -)"
- Duplicate fzf → Removed duplicate eval "$(fzf --zsh)" (was on lines
542 & 545)
- Duplicate exports → Removed duplicate GOROOT, LC_ALL
- Sensitive data → Moved tokens/passwords to bottom with comment
suggesting .zshrc-personal
3. New Structure Benefits
- 655 lines → ~500 lines (cleaner, no duplication)
- PATH set once → All tools can find their binaries before
initialization
- Logical flow → Dependencies resolved before they're needed
- Easier maintenance → Each section clearly labeled and grouped

Test it:

source ~/.zshrc

tmuxifier help  # Should work without errors now

The file passed syntax validation (zsh -n). Restart your terminal or run

source ~/.zshrc to apply the changes.

### Tmuxifier Install

To install Tmuxifier, first clone the repository to your machine using
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier,
then add export PATH="$HOME/.tmuxifier/bin:$PATH"
to your .zshrc file to make the Tmuxifier executable available.
Finally, restart your terminal or run source ~/.zshrc to apply the
changes.
