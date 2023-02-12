-- Добавляем Packer как пакет в Neovim
vim.cmd [[packadd packer.nvim]]

-- Используем данный коллбэк как список для плагинов
return require('packer').startup(function()

  -- Добавляем Packer в список, чтобы он обновлял сам себя
  use 'wbthomason/packer.nvim'
  -- набор Lua функций, используется как зависимость в большинстве
  -- плагинов, где есть работа с асинхронщиной
  use 'nvim-lua/plenary.nvim'

  -- Значки для проводника и панели вкладок
  use 'nvim-tree/nvim-web-devicons'
  -- Проводник
  use { 'nvim-tree/nvim-tree.lua', tag = 'nightly' }
  -- Панель вкладок
  use { 'akinsho/bufferline.nvim', tag = 'v3.*' }

  -- Статуслайн
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
     -- require('plugins/lualine')
    end }

  -- Интеграция с ranger
  use 'kevinhwang91/rnvimr'

  -- Терминал
  use { 's1n7ax/nvim-terminal',
    config = function()
        vim.o.hidden = true
        require('nvim-terminal').setup()
    end }

  -- Автодополнение скобок и кавычек
  use { 'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup {}
    end }

  -- Подсветка синтаксиса
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
  use 'p00f/nvim-ts-rainbow'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'nvim-treesitter/playground'
  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Поиск
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
  use 'nvim-telescope/telescope-fzf-native.nvim'

  -- LSP сервер
  use 'williamboman/mason.nvim' -- Инсталлер для серверов LSP
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  -- Keep Mason updated
  use 'WhoIsSethDaniel/mason-tool-installer.nvim'
  -- Useful status updates for LSP
  use 'j-hui/fidget.nvim'

  -- Автодополнение
  use 'hrsh7th/nvim-cmp' -- движок автодополнения для LSP
  use 'L3MON4D3/LuaSnip' -- движок для снипетов
  use 'saadparwaiz1/cmp_luasnip' -- автодополнения для сниппетов
  -- зависимости для движка автодополнения:
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-emoji'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-nvim-lua'
  use 'jalvesaq/cmp-nvim-r'
  -- набор готовых сниппетов для всех языков
  use 'rafamadriz/friendly-snippets'
  -- ИИ автодополнения
 	use {'tzachar/cmp-tabnine', run='./install.sh' } --, requires = 'hrsh7th/nvim-cmp'}
  -- иконки в выпадающем списке автодополнений
  use 'onsails/lspkind-nvim'

  --Темы 
  --use 'gruvbox-community/gruvbox'
  use 'arcticicestudio/nord-vim'
  use 'ellisonleao/gruvbox.nvim'

  -- Предпросмотр цветов css
  use 'ap/vim-css-color'
  use 'norcalli/nvim-colorizer.lua'

  -- LaTeX support
  use 'lervag/vimtex'
  -- R 
  use "jalvesaq/Nvim-R"
  -- Markdown 
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Коментирование
  use 'terrortylor/nvim-comment'

end)


-- Simple plugins can be specified as strings
--[[--
    use 'rstacruz/vim-closer'
    --]] --

-- Lazy loading:
-- Load on specific commands
--[[--
    use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
    --]] --

-- Load on an autocommand event
--[[--
    use {'andymass/vim-matchup', event = 'VimEnter'}
    --]] --

-- Load on a combination of conditions: specific filetypes or commands
-- Also run code after load (see the "config" key)
--use {
--'w0rp/ale',
--ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
--cmd = 'ALEEnable',
--config = 'vim.cmd[[ALEEnable]]'}

-- Plugins can have dependencies on other plugins
--[[--
    use {'haorenW1025/completion-nvim',opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}}
    --]] --


-- Post-install/update hook with call of vimscript function with argument
--[[--
    use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
    --]] --

-- Use dependency and run lua function after load
--[[--
    use {
        'lewis6991/gitsigns.nvim',
          requires = { 'nvim-lua/plenary.nvim' },
          config = function() require('gitsigns').setup() end
    }
    --]] --

