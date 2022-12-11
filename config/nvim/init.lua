vim.g.mapleader = " "

vim.api.nvim_set_keymap('i','jk','ESC', { noremap = true })

vim.o.relativenumber = true
vim.o.number = true

--require("configs.settings")
require("plugins/packer_install") -- To read packer.nvim
require("plugins/gruvbox")
--require('base/search')
--require('base/tabs')
--require('base/other')
--require('keys/alias')
