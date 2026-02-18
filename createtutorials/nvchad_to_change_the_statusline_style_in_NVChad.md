To change the statusline style in NVChad

you have several options available through the statusline module
configuration.

Here are the different styles you can use:

→ Read lua/custom/chadrc.lua

Here are all the statusline style options you can configure:

Statusline Themes

You can change the theme option to one of these:
- "default" - Traditional NVChad statusline
- "vscode" - VSCode-inspired statusline
- "vscode_colored" - Colored VSCode variant
- "minimal" - Minimal statusline design
Separator Styles
You can change the separator_style option to one of these:
- "default" - Default separators
- "round" - Rounded separators (works with default theme)
- "block" - Block separators (what you're currently using)
- "arrow" - Arrow-style separators
Examples
VSCode style with round separators:
M.ui = {
  theme = 'catppuccin',
  statusline = {
    theme = "vscode",
    separator_style = "round",
    overriden_modules = nil,
  },
}
Minimal style with default separators:
M.ui = {
  theme = 'catppuccin',
  statusline = {
    theme = "minimal",
    separator_style = "default",
    overriden_modules = nil,
  },
}
VSCode colored with arrow separators:
M.ui = {
  theme = 'catppuccin',
  statusline = {
    theme = "vscode_colored",
    separator_style = "arrow",
    overriden_modules = nil,
  },
}

Simply edit /home/srhills/.config/nvim/lua/custom/chadrc.lua and change
the theme and/or separator_style values to your preferred combination,
then restart Neovim to see the changes take effect.
