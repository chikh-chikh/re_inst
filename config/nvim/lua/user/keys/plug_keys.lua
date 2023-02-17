--Горячие клавиши для плагинов
require("user.keys.alias")
--vim.g.mapleader = vim.api.nvim_replace_termcodes('<BS>', false, false, true)
vim.g.mapleader = ' ' -- Используем Space, как клавишу для альтернативных хотекеев

-- LSP (все горячие клавиши начинаются с g), кроме ховера
nm('lf', '<cmd>lua vim.lsp.buf.formatting()<CR>') -- Форматировать документ

-- BufferLine
nm('>', '<cmd>BufferLineCycleNext<CR>')
nm('<', '<cmd>BufferLineCyclePrev<CR>')

-- Ranger
nm('<leader>r', '<cmd>RnvimrToggle<CR>')
