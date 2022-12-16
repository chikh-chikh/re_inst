vim.cmd('filetype plugin indent on')

vim.o.relativenumber = true
--vim.o.number = true
vim.o.cursorline = true

vim.o.mouse = "a"
vim.wo.wrap = false
vim.wo.number = true
vim.o.signcolumn = "yes"

vim.o.wildmenu = true
vim.o.confirm = true
vim.o.incsearch = true
vim.o.title = true
vim.o.guicursor = true

vim.o.fileencoding = 'utf-8'

vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.hidden = true
--vim.o.whichrap = 'b,s,<,>,[,],h,l'
vim.o.cmdheight = 1
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.termguicolors = true
--vim.o.conceallevel = 0
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.timeoutlen = 200
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.scrolloff = 3
vim.o.sidescrolloff = 5


vim.o.helplang = "ru,en"
