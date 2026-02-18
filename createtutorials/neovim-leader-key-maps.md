❯ grep "<leader>" mappings.lua
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number"
})
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative
number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle
nvcheatsheet" })
map({ "n", "x" }, "<leader>fm", function()
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP
diagnostic loclist" })
  map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })
  map("n", "<leader>x", function()
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus
window" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc =
"telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope
find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc =
"telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope
find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc =
"telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", {
desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc =
"telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc =
"telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope
pick hidden term" })
map("n", "<leader>th", function()
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc =
"telescope find files" })
  "<leader>fa",
map("n", "<leader>h", function()
map("n", "<leader>v", function()
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all
keymaps" })
map("n", "<leader>wk", function()
