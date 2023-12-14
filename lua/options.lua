-- nvim/lua/options.lua

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.clipboard = 'unnamedplus'

vim.o.number = true
--vim.o.relativenumber = true

vim.o.signcolumn = 'yes'

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.updatetime = 300

vim.o.termguicolors = true

vim.o.mouse = 'a'

-- keymaps

vim.keymap.set('n', '<S-q>', ':Ex<cr>')
