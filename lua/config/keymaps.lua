-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.o.timeoutlen = 625
local keymap = vim.keymap.set
local silent = { silent = true }
local silent_opts = { silent = true, noremap = true }

keymap("i", "kj", "<ESC>", silent)
keymap("n", "<leader>q", ":q<CR>")
keymap("n", "<esc>", ":noh<cr>", silent_opts)

keymap("n", "<leader>ta", ":$tabnew<CR>", silent_opts)
keymap("n", "<leader>tc", ":tabclose<CR>", silent_opts)
keymap("n", "<leader>to", ":tabonly<CR>", silent_opts)
keymap("n", "<leader>tn", ":tabn<CR>", silent_opts)
keymap("n", "<leader>tp", ":tabp<CR>", silent_opts)
-- move current tab to previous position
keymap("n", "<leader>tmp", ":-tabmove<CR>", silent_opts)
-- move current tab to next position
keymap("n", "<leader>tmn", ":+tabmove<CR>", silent_opts)

--local lazyMapping = { silent = true, noremap = false  }
--keymap("n", "<leader>ll", ":Lazy<CR>", lazyMapping)
--keymap("n", "<leader>lg", ":LazyGit<CR>", silent_opts)

