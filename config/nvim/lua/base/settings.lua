-- Все время использовать vim.opt - не удобно, поэтому сделаем алиас
local opt = vim.opt
--[[ Настройка панелей ]]--
-- Вертикальные сплиты становятся справа
-- По умолчанию панели в Neovim ставятся в зависимости от расположения текущей панели.
-- Данная настройка поможет нам держать панели в порядке
opt.splitright = true
-- Горизонтальные сплиты становятся снизу
opt.splitbelow = true
--[[ Дополнительные настройки ]]--
-- Используем системный буфер обмена
opt.clipboard = 'unnamedplus'
-- Отключаем дополнение файлов в конце
opt.fixeol = false
-- Автодополнение (встроенное в Neovim)
opt.completeopt = 'menuone,noselect'
-- Не автокомментировать новые линии при переходе на новую строку
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

--vim.cmd('filetype plugin indent on')

opt.termguicolors = false --true

opt.relativenumber = false 
--opt.number = true
opt.cursorline = true
--opt.cursorcolumn = true
opt.mouse = "a"
vim.wo.wrap = false
vim.wo.number = true
opt.signcolumn = "yes"

opt.wildmenu = true
opt.confirm = true
opt.incsearch = true
opt.title = true
--opt.guicursor = true

opt.fileencoding = 'utf-8'

--opt.shortmess = opt.shortmess .. 'c'
opt.hidden = true
--opt.whichrap = 'b,s,<,>,[,],h,l'
opt.cmdheight = 0
--opt.conceallevel = 0
opt.showmode = false
opt.backup = false
opt.writebackup = false
opt.updatetime = 300
opt.timeoutlen = 200
opt.hlsearch = false
opt.scrolloff = 8
opt.sidescrolloff = 5

opt.helplang = "ru,en"
