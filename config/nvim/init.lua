vim.g.mapleader = " "

vim.api.nvim_set_keymap('i','jk','ESC', { noremap = true })

vim.o.relativenumber = true
vim.o.number = true

require('myluamodule')

require('lualine').setup()
