--Горячие клавиши для плагинов
require("keys/alias")
--vim.g.mapleader = vim.api.nvim_replace_termcodes('<BS>', false, false, true)
vim.g.mapleader = ' '                                               -- Используем Space, как клавишу для альтернативных хотекеев
vim.g.maplocalleader = ' '                                               -- Используем Space, как клавишу для альтернативных хотекеев

-- LSP (все горячие клавиши начинаются с g), кроме ховера   
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>')                       -- Ховер для объекта
nm('gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')                 -- Форматировать документ
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')                -- Действия с кодом
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')                     -- Переименовать объект
nm('gd', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
-- NvimTree 
nm('<leader>v', '<cmd>NvimTreeToggle<CR>')
nm('<leader>vv', '<cmd>NvimTreeFocus<CR>')
-- Ranger
nm('<leader>r', '<cmd>RnvimrToggle<CR>')
-- Terminal

-- Telescope
nm('fd', '<cmd>Telescope lsp_definitions<CR>')            -- Объявления в LSP
nm('<leader>o', '<cmd>Telescope oldfiles<CR>')            -- Просмотр недавних файлов
nm('<leader>f', '<cmd>Telescope git_files<CR>')           -- Поиск файлов
nm('<leader>b', '<cmd>Telescope git_branches<CR>')        -- Ветки в Git
nm('<leader>s', '<cmd>Telescope live_grep<CR>')           -- Поиск строки
nm('<leader>q', '<cmd>Telescope buffers<CR>')             -- Буфферы

-- BufferLine
nm('>', '<cmd>BufferLineCycleNext<CR>')
nm('<', '<cmd>BufferLineCyclePrev<CR>')
-- BufferLine
nm('<leader>c', '<cmd>bd<CR>')                             -- Закрыть буффер
nm('<leader>l', '<cmd>BufferLineCycleNext<CR>')            -- Перейти в следующий буффер
nm('<leader>h', '<cmd>BufferLineCyclePrev<CR>')            -- Перейти в предыдущий буффер
nm('`', '<cmd>BufferLineMoveNext<CR>')                     -- Переместить буффер
nm('~', '<cmd>BufferLineMovePrev<CR>')                     -- Переместить буффер

-- Git
--nm('<leader>gp', '<cmd>Gitsigns preview_hunk<CR>')
--nm('<leader>gb', '<cmd>Gitsigns blame_line<CR>')

-- SymbolsOutline
--nm('<leader>s', '<cmd>SymbolsOutline<CR>')                        -- Структура для файла

-- Formatter
--nm('<leader>l', '<cmd>Format<CR>')

-- Trouble
--nm('<leader>x', '<cmd>TroubleToggle<CR>')                         -- Открыть меню с проблемами LSP
--nm('gr', '<cmd>Trouble lsp_references<CR>')                       -- Референсы в LSP



