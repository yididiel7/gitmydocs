# Neovim Help System - Commands & Keys

Basic Help Commands

Opening Help

- :help or :h - Open main help page
- :help {subject} - Get help on specific topic (e.g., :help nvim-tree)
- :helpgrep {pattern} - Search help for pattern
- :help! - Force help (useful when command exists)

Your Custom Key Mappings

From your configuration, you have these help-related mappings:

Leader-based mappings:

- <leader>fh - Telescope help tags (fuzzy search through help pages)
- <leader>ls - LSP signature help (shows function signatures)

Help Navigation

Moving in Help Windows
- j/k - Move up/down lines
- h/l - Move left/right
- Ctrl+u/Ctrl+d - Page up/down
- gg/G - Go to top/bottom
- /{pattern} - Search forward
- ?{pattern} - Search backward
- n/N - Next/previous search result

Links (Tags)

- Ctrl+] or <Enter> - Follow link under cursor
- Ctrl+t - Jump back (go back to previous topic)
- Ctrl+o - Jump to older position
- Ctrl+i - Jump to newer position

Window Management

- :close or :q - Close help window
- :only - Make help window the only one
- :split - Split window and open help

Advanced Help Features

Help Categories

- :help functions - All built-in functions
- :help options - All options
- :help commands - All commands
- :help pattern - Search patterns
- :help usr_01 - User manual (01-40 chapters)

Context-Sensitive Help

- K (normal mode) - Get help for word under cursor
- :help word - Help for specific word/command
Telescope Integration (Your Setup)
Use <leader>fh to get fuzzy searchable help:
- Type keywords to filter help topics
- Much faster than traditional help navigation

Quick Reference Commands

" Most useful help commands

:h quickref          " Quick reference guide
:h tutor             " Interactive tutorial
:h index             " Help index
:h helphelp          " Help about help system
:h pattern.txt       " Pattern matching
:h :help             " Help about :help command
:h netrw             " File browser help
:h lsp               " LSP functionality

Getting Help for Specific Topics

For plugins:

- :help nvim-tree - Help for nvim-tree plugin
- :help telescope - Help for telescope
- :help which-key - Help for which-key

For programming:
- :help ft-python - Python file type help
- :help lsp-config - LSP configuration
- :help treesitter - Treesitter features

For configuration:

- :help init.lua - Lua configuration
- :help vim.keymap.set - Key mapping function
- :help vim.opt - Setting options

Your <leader>fh mapping to Telescope help_tags is the most efficient way
to search through available help topics interactively.


## Install from package

Arch Linux

Neovim can be installed from the community repository:

sudo pacman -S neovim

Alternatively, Neovim can be also installed using the PKGBUILD
neovim-git, available on the AUR.

Alternatively, Neovim Nightly builds can be also installed using the
PKGBUILD neovim-nightly-bin,
available on the AUR.

The Python module is available from the community repository:

sudo pacman -S python-pynvim

Ruby modules (currently only supported in neovim-git) are available from
the AUR as ruby-neovim.
