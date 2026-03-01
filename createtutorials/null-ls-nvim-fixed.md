Fixed! The issues were:

1. Duplicate null-ls entries - You had null-ls.nvim defined twice in
plugins.lua (lines 81-86 and 94-99). Removed the duplicate.
2. Wrong require statement - Your config file was requiring "none-ls"
instead of "null-ls".
3. Cache corruption - The Lua cache had corrupted entries mixing none-ls
and null-ls.

What to do now:

1. Restart Neovim completely
2. The error should be resolved
If you still get errors after restart, you may also need to run
:PackerSync or :Lazy sync to ensure all plugins are properly updated.

Perfect! I've fixed both occurrences of the deprecated
vim.tbl_add_reverse_lookup function in the null-ls.nvim plugin. The
changes replace the deprecated function calls with manual reverse lookup
creation, which is the recommended approach in newer Neovim versions.

OThe fixes:
1. Line 17: Replaced vim.tbl_add_reverse_lookup(lsp_methods) with a
manual loop
2. Line 29: Replaced vim.tbl_add_reverse_lookup(internal_methods) with a
manual loop
This should resolve the deprecation warning you're seeing when using
Neovim.
