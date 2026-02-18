- ✅ OK Most of these checks are for informational purposes only.
  WARNINGS should be treated as a warning, and don't necessarily indicate a problem with your config.
  Please |DON'T| report these warnings as an issue.
"#003300"
Checking your config ~
- ⚠️ WARNING |mini.icons| is not installed
- ✅ OK |nvim-web-devicons| is installed

Checking for issues with your mappings ~
- ⚠️ WARNING You're using an old version of the which-key spec.
  Your mappings will work, but it's recommended to update them to the new version.
  Please check the docs and suggested spec below for more info.
  Mappings: >
  {
    f = {
      name = "Find"
    },
    prefix = "<leader>"
  }

  -- Suggested Spec:
  {
    { "<leader>f", group = "Find" },
  }
- ⚠️ WARNING You're using an old version of the which-key spec.
  Your mappings will work, but it's recommended to update them to the new version.
  Please check the docs and suggested spec below for more info.
  Mappings: >
  {
    ["/"] = { <function 1>, "Toggle comment" },
    mode = "n",
    prefix = "<leader>"
  }

  -- Suggested Spec:
  {
    { "<leader>/", <function 1>, desc = "Toggle comment" },
  }
- ⚠️ WARNING You're using an old version of the which-key spec.
  Your mappings will work, but it's recommended to update them to the new version.
  Please check the docs and suggested spec below for more info.
  Mappings: >
  {
    ["/"] = { "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", "Toggle comment" },
    mode = "v",
    prefix = "<leader>"
  }

  -- Suggested Spec:
  {
    { "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", desc = "Toggle comment", mode = "v" },
  }
- ⚠️ WARNING You're using an old version of the which-key spec.
  Your mappings will work, but it's recommended to update them to the new version.
  Please check the docs and suggested spec below for more info.
  Mappings: >
  {
    fb = { <function 1>, "Find Buffer" },
    ff = { <function 2>, "Find File" },
    fg = { <function 3>, "Find with Grep" },
    fh = { <function 4>, "Find Help" },
    fn = { ":Telescope file_browser path=%:p:help |select_buffer=true<CR>|", "File Browser" },
    prefix = "<leader>"
  }

  -- Suggested Spec:
  {
    { "<leader>fb", <function 1>, desc = "Find Buffer" },
    { "<leader>ff", <function 1>, desc = "Find File" },
    { "<leader>fg", <function 1>, desc = "Find with Grep" },
    { "<leader>fh", <function 1>, desc = "Find Help" },
    { "<leader>fn", ":Telescope file_browser path=%:p:help |select_buffer=true<CR>|", desc = "File Browser" },
  }

checking for overlapping keymaps ~
- ⚠️ WARNING In mode `n`, <gc> overlaps with <gcc>:
  - <gc>: Comment toggle linewise
  - <gcc>: Comment toggle current line
- ⚠️ WARNING In mode `n`, <gb> overlaps with <gbc>:
  - <gb>: Comment toggle blockwise
  - <gbc>: Comment toggle current block
- ✅ OK Overlapping keymaps are only reported for informational purposes.
  This doesn't necessarily mean there is a problem with your config.

Checking for duplicate mappings ~
- ✅ OK No duplicate mappings found
