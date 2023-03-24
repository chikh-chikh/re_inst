
-- LSP (все горячие клавиши начинаются с g), кроме ховера
Keymap("n", " K",  " <cmd>lua vim.lsp.buf.hover()<CR>" )                       -- Ховер для объекта
Keymap("n", " gf",  " <cmd>lua vim.lsp.buf.formatting()<CR>" )                 -- Форматировать документ
Keymap("n", " ga",  " <cmd>lua vim.lsp.buf.code_action()<CR>" )                -- Действия с кодом
Keymap("n", " gR",  " <cmd>lua vim.lsp.buf.rename()<CR>" )                     -- Переименовать объект
Keymap("n", " gd",  " <cmd>lua vim.lsp.buf.type_definition()<CR>" )


-- Telescope
Keymap("n", " fd",  " <cmd>Telescope lsp_definitions<CR>" )            -- Объявления в LSP
Keymap("n", " <leader>o",  " <cmd>Telescope oldfiles<CR>" )            -- Просмотр недавних файлов
Keymap("n", " <leader>f",  " <cmd>Telescope git_files<CR>" )           -- Поиск файлов
Keymap("n", " <leader>b",  " <cmd>Telescope git_branches<CR>" )        -- Ветки в Git
Keymap("n", " <leader>s",  " <cmd>Telescope live_grep<CR>" )           -- Поиск строки
Keymap("n", " <leader>q",  " <cmd>Telescope buffers<CR>" )             -- Буфферы

-- BufferLine
Keymap("n", " <leader>c",  " <cmd>bd<CR>" )                             -- Закрыть буффер
Keymap("n", " <leader>l",  " <cmd>BufferLineCycleNext<CR>" )            -- Перейти в следующий буффер
Keymap("n", " <leader>h",  " <cmd>BufferLineCyclePrev<CR>" )            -- Перейти в предыдущий буффер

-- Git
--Keymap("n", " <leader>gp",  " <cmd>Gitsigns preview_hunk<CR>" )
--Keymap("n", " <leader>gb",  " <cmd>Gitsigns blame_line<CR>" )

-- SymbolsOutline
--Keymap("n", " <leader>s",  " <cmd>SymbolsOutline<CR>" )                        -- Структура для файла

-- Formatter
--Keymap("n", " <leader>l",  " <cmd>Format<CR>" )

-- Trouble
--Keymap("n", " <leader>x",  " <cmd>TroubleToggle<CR>" )                         -- Открыть меню с проблемами LSP
--Keymap("n", " gr",  " <cmd>Trouble lsp_references<CR>" )                       -- Референсы в LSP



