-- local status_ok, configs = pcall(require, "nvim-treesitter.configs")
-- if not status_ok then
--   return
-- end

local M = {}
-- configs.setup {
-- local opts = {
  -- A list of parser names, or "all", "maintained" (parsers with maintainers), or a list of languages
 M.ensure_installed = {
    "latex",
    "markdown_inline",
    "markdown",
    "lua",
    "python",
    "vim",
    "yaml",
    "perl",
    "json",
    "html",
    "help",
    "haskell",
    "gitignore",
    "bibtex",
    "rust",
    "r",
  }
  -- Install parsers synchronously (only applied to `ensure_installed`)
  M.sync_install = false -- install languages synchronously (only applied to `ensure_installed`)
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  M.auto_install = true
  -- List of parsers to ignore installing (for "all")
  M.ignore_install = { "latex" } --{ "javascript" },-- List of parsers to ignore installing
  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
  M.autopairs = {
    enable = true,
  }
  M.highlight = {
    -- `false` will disable the whole extension
    enable = true, -- false will disable the whole extension
    disable = { "css","latex" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  }
  M.indent = { enable = true, disable = { "python", "css", "yaml" } }
  M.context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
  M.rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
  M.playground = {
    enable = false,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o', -- Переключает редактор запросов, когда игровая площадка сфокусирована.
      toggle_hl_groups = 'i', -- Переключает видимость групп подсветки.
      toggle_injected_languages = 't', -- Переключает видимость вводимых языков.
      toggle_anonymous_nodes = 'a', -- Переключает видимость анонимных узлов.
      toggle_language_display = 'I', -- Переключает видимость языка, к которому принадлежит узел.
      focus_language = 'f', -- Фокусирует дерево языка под курсором на игровой площадке. Редактор запросов теперь будет использовать специализированный язык.
      unfocus_language = 'F', -- Расфокусирует текущий язык.
      update = 'R', -- Обновляет представление игровой площадки при фокусировке или перезагружает запрос при фокусировке редактора запросов.
      goto_node = '<cr>', -- Перейти к текущему узлу в буфере кода
      show_help = '?',
    }
  }
  M.query_linter = {
    enable = false,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  }
-- }

return M
