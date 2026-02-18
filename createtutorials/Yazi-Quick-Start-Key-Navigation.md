Title: Quick Start | Yazi
Yazi-Quick-Start-Key-Navigation.md

URL Source: https://yazi-rs.github.io/docs/quick-start

URL Converted
Source:https://r.jina.ai/https://yazi-rs.github.io/docs/quick-start

Published Time: Mon, 02 Feb 2026 13:24:34 GMT

Markdown Content:
Once you've [installed
Yazi](https://yazi-rs.github.io/docs/installation), start the program
with:

`yazi`

Press q to quit, F1 or ~ to open the help menu.

Shell
wrapper[​](https://yazi-rs.github.io/docs/quick-start#shell-wrapper
"Direct link to Shell wrapper")
---------------------------------------------------------------------------------------------------------

We suggest using this `y` shell wrapper that provides the ability to
change the current working directory when exiting Yazi.

*   Bash / Zsh
*   Fish
*   Nushell
*   POSIX
*   Elvish
*   PowerShell
*   Command Prompt
*   Xonsh

`function y() {	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd	command
yazi "$@" --cwd-file="$tmp"	IFS= read -r -d '' cwd < "$tmp"	[ "$cwd" !=
"$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"	rm -f -- "$tmp"}`

To use it, copy the function into the configuration file of your
respective shell.

Then use `y` instead of `yazi` to start, and press q to quit, you'll see
the CWD changed. Sometimes, you don't want to change, press Q to quit.

Keybindings[​](https://yazi-rs.github.io/docs/quick-start#keybindings
"Direct link to Keybindings")
---------------------------------------------------------------------------------------------------

### Navigation[​](https://yazi-rs.github.io/docs/quick-start#navigation "Direct link to Navigation")

To navigate between files and directories you can use the arrow keys ←,
↓, ↑ and → or Vim-like keys such as h, j, k, l:

| Key binding | Alternate key | Action |
| --- | --- | --- |
| k | ↑ | Move the cursor up |
| j | ↓ | Move the cursor down |
| l | → | Enter hovered directory |
| h | ← | Leave the current directory and into its parent |

Further navigation commands can be found in the table below.

| Key binding | Action |
| --- | --- |
| K | Seek up 5 units in the preview |
| J | Seek down 5 units in the preview |
| g ⇒ g | Move cursor to the top |
| G | Move cursor to the bottom |
| z | [Cd](https://yazi-rs.github.io/docs/configuration/keymap#mgr.cd) to a directory or [reveal](https://yazi-rs.github.io/docs/configuration/keymap#mgr.reveal) a file via fzf |
| Z | [Cd](https://yazi-rs.github.io/docs/configuration/keymap#mgr.cd) to a directory via zoxide |
| g ⇒ Space | [Cd](https://yazi-rs.github.io/docs/configuration/keymap#mgr.cd) to a directory or [reveal](https://yazi-rs.github.io/docs/configuration/keymap#mgr.reveal) a file via interactive prompt |

### Selection[​](https://yazi-rs.github.io/docs/quick-start#selection "Direct link to Selection")

To select files and directories, the following commands are available.

| Key binding | Action |
| --- | --- |
| Space | Toggle selection of hovered file/directory |
| v | Enter visual mode (selection mode) |
| V | Enter visual mode (unset mode) |
| Ctrl + a | Select all files |
| Ctrl + r | Inverse selection of all files |
| Esc | Cancel selection |

### File operations[​](https://yazi-rs.github.io/docs/quick-start#file-operations "Direct link to File operations")

To interact with selected files/directories use any of the commands
below.

| Key binding | Action |
| --- | --- |
| o | Open selected files |
| O | Open selected files interactively |
| Enter | Open selected files |
| Shift + Enter | Open selected files interactively (some terminals don't support it yet) |
| Tab | Show the file information |
| y | Yank selected files (copy) |
| x | Yank selected files (cut) |
| p | Paste yanked files |
| P | Paste yanked files (overwrite if the destination exists) |
| Y or X | Cancel the yank status |
| d | Trash selected files |
| D | Permanently delete selected files |
| a | Create a file (ends with / for directories) |
| r | Rename selected file(s) |
| . | Toggle the visibility of hidden files |

Further file operation commands can be found in the table below.

| Key binding | Action |
| --- | --- |
| ; | Run a shell command |
| : | Run a shell command (block until finishes) |
| - | Symlink the absolute path of yanked files |
| _ | Symlink the relative path of yanked files |
| Ctrl + - | Hardlink yanked files |

### Copy paths[​](https://yazi-rs.github.io/docs/quick-start#copy-paths "Direct link to Copy paths")

To copy paths, use any of the following commands below.

_Observation: c ⇒ d indicates pressing the c key followed by pressing
the d key._

| Key binding | Action |
| --- | --- |
| c ⇒ c | Copy the file path |
| c ⇒ d | Copy the directory path |
| c ⇒ f | Copy the filename |
| c ⇒ n | Copy the filename without extension |

### Filter files[​](https://yazi-rs.github.io/docs/quick-start#filter-files "Direct link to Filter files")

| Key binding | Action |
| --- | --- |
| f | Filter files |

### Find files[​](https://yazi-rs.github.io/docs/quick-start#find-files "Direct link to Find files")

| Key binding | Action |
| --- | --- |
| / | Find next file |
| ? | Find previous file |
| n | Go to the next found |
| N | Go to the previous found |

### Search files[​](https://yazi-rs.github.io/docs/quick-start#search-files "Direct link to Search files")

| Key binding | Action |
| --- | --- |
| s | Search files by name using [fd](https://github.com/sharkdp/fd) |
| S | Search files by content using [ripgrep](https://github.com/BurntSushi/ripgrep) |
| Ctrl + s | Cancel the ongoing search |

### Sorting[​](https://yazi-rs.github.io/docs/quick-start#sorting "Direct link to Sorting")

To sort files/directories use the following commands.

_Observation: , ⇒ a indicates pressing the , key followed by pressing
the a key._

| Key binding | Action |
| --- | --- |
| , ⇒ m | Sort by modified time |
| , ⇒ M | Sort by modified time (reverse) |
| , ⇒ b | Sort by birth time |
| , ⇒ B | Sort by birth time (reverse) |
| , ⇒ e | Sort by file extension |
| , ⇒ E | Sort by file extension (reverse) |
| , ⇒ a | Sort alphabetically |
| , ⇒ A | Sort alphabetically (reverse) |
| , ⇒ n | Sort naturally |
| , ⇒ N | Sort naturally (reverse) |
| , ⇒ s | Sort by size |
| , ⇒ S | Sort by size (reverse) |
| , ⇒ r | Sort randomly |

### Multi-tab[​](https://yazi-rs.github.io/docs/quick-start#multi-tab "Direct link to Multi-tab")

| Key binding | Action |
| --- | --- |
| t | Create a new tab with CWD |
| 1, 2, ..., 9 | Switch to the N-th tab |
| [ | Switch to the previous tab |
| ] | Switch to the next tab |
| { | Swap current tab with previous tab |
| } | Swap current tab with next tab |
| Ctrl + c | Close the current tab |

Flavors[​](https://yazi-rs.github.io/docs/quick-start#flavors "Direct
link to Flavors")
---------------------------------------------------------------------------------------

Pick a color scheme you like from our [flavors
repository](https://github.com/yazi-rs/flavors), or [cook a
flavor](https://yazi-rs.github.io/docs/flavors/overview#cooking)!
