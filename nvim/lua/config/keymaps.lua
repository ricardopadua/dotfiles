-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- ========================================================================== --
-- ==                             KEYMAP                                   == --
-- ========================================================================== --

-- Navigation and basic editing
vim.keymap.set({'n', 'x', 'o'}, '<leader>h', '^', { desc = 'Move to first non-blank character' })
vim.keymap.set({'n', 'x', 'o'}, '<leader>l', 'g_', { desc = 'Move to last non-blank character' })
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>', { desc = 'Select all text' })
vim.keymap.set({'n', 'x'}, 'cp', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set({'n', 'x'}, 'cv', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set({'n', 'x'}, 'x', '"_x', { desc = 'Delete without yanking' })

-- Buffer interaction
vim.keymap.set('n', '<leader>bw', '<cmd>write<cr>', { desc = 'Save current buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>bl', '<cmd>buffer #<cr>', { desc = 'Switch to last buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<cr>', { desc = 'Go to previous buffer' })

-- Fuzzy finder and search interaction
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Telescope: Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Telescope: List buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Telescope: Help tags" })