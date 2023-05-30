vim.g.mapleader = '.'
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.undolevels = 1000
-- use spaces for tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremaps = true, expr = true, silent = true }

keymap("i", "kj", "<ESC>", default_opts)
keymap("t", "kj", "<C-\\><C-n>", default_opts)
keymap("n", "<CR>", ":noh<CR><CR>", default_opts)
keymap("i", ",m", "<ESC>:w<CR>:!clear;python3 %<CR>", default_opts)
keymap("n", ",m", ":w<CR>:!clear;python3 %<CR>", default_opts)
