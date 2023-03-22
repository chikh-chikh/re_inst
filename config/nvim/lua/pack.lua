local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	-- vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})


-- Добавляем Packer как пакет в Neovim
-- vim.cmd [[packadd packer.nvim]]

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
  use { "Shatur/neovim-session-manager" }
  use { "ahmedkhalf/project.nvim" }

  -- Панель вкладок
  use { 'akinsho/bufferline.nvim', tag = 'v3.*' }
  -- Статуслайн
  use { 'nvim-lualine/lualine.nvim' }
  --Appearance
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "goolord/alpha-nvim" }
  use { "RRethy/vim-illuminate" }

  -- General
  use { "numToStr/Comment.nvim" }
  -- use { "JoosepAlviste/nvim-ts-context-commentstring" }
  use { "lewis6991/impatient.nvim" }
  use { "kylechui/nvim-surround" }
  use { "mbbill/undotree" } -- Vimscript
  use { "mg979/vim-visual-multi" } -- Vimscript
  use { "glacambre/firenvim" } -- Vimscript
  use { "gbprod/yanky.nvim" }

  -- Mappings
  use { "folke/which-key.nvim" }

  -- Интеграция с ranger
  use 'kevinhwang91/rnvimr'

  -- Терминал
  use 'akinsho/toggleterm.nvim'

  -- Автодополнение скобок и кавычек
  use 'windwp/nvim-autopairs'

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
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzf-native.nvim'
  use 'stevearc/dressing.nvim'
  use { "nvim-telescope/telescope-bibtex.nvim",
    config = function()
      require "telescope".load_extension("bibtex")
    end,
  }

  -- LSP сервер
  use 'williamboman/mason.nvim' -- Инсталлер для серверов LSP
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  -- for formatters and linters
  use 'jose-elias-alvarez/null-ls.nvim'
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
  use "hrsh7th/cmp-cmdline" -- command completions
  use "f3fora/cmp-spell" -- spelling completions
  use "hrsh7th/cmp-omni" -- helps Vimtex completions
  -- use { "aspeddro/cmp-pandoc.nvim" }
  -- use { "garbas/vim-snipmate" }
  -- набор готовых сниппетов для всех языков
  use 'rafamadriz/friendly-snippets'
  -- ИИ автодополнения
  -- use { 'tzachar/cmp-tabnine', run = './install.sh' } --, requires = 'hrsh7th/nvim-cmp'}
  -- иконки в выпадающем списке автодополнений
  use 'onsails/lspkind-nvim'

  --Темы
  --use 'gruvbox-community/gruvbox'
  use 'arcticicestudio/nord-vim'
  use 'ellisonleao/gruvbox.nvim'
  -- use { "EdenEast/nightfox.nvim" }
  -- use { "navarasu/onedark.nvim" }

  -- Предпросмотр цветов css
  use 'ap/vim-css-color'
  use 'norcalli/nvim-colorizer.lua'

  -- R
  use "jalvesaq/Nvim-R"
  use "REditorSupport/languageserver"
  -- use "jozefhajnala/languageserversetup"

  -- LaTeX support
  use "lervag/vimtex" -- essential for LaTeX; Vimscript
  use "kdheepak/cmp-latex-symbols"
  use "jbyuki/nabla.nvim" -- show symbols in editor
  -- Markdown
  use({ "iamcco/markdown-preview.nvim",  run = function() vim.fn["mkdp#util#install"]() end, })
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  use({
    "gaoDean/autolist.nvim",
    ft = {
      "markdown",
      "text",
      "tex",
      "plaintex",
    },
    config = function()
      local autolist = require("autolist")
      autolist.setup()
      autolist.create_mapping_hook("i", "<CR>", autolist.new)
      autolist.create_mapping_hook("i", "<Tab>", autolist.indent)
      autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent, "<C-D>")
      autolist.create_mapping_hook("n", "o", autolist.new)
      autolist.create_mapping_hook("n", "O", autolist.new_before)
      -- autolist.create_mapping_hook("n", ">>", autolist.indent)
      -- autolist.create_mapping_hook("n", "<<", autolist.indent)
      autolist.create_mapping_hook("n", "<leader>r", autolist.force_recalculate)
      autolist.create_mapping_hook("n", "<leader>x", autolist.invert_entry, "")
        vim.api.nvim_create_autocmd("TextChanged", {
          pattern = "-",
          callback = function()
            vim.cmd.normal({autolist.force_recalculate(nil, nil), bang = false})
          end
        })
    end,
  })
  -- Коментирование
  use 'terrortylor/nvim-comment'

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use {
   'ldelossa/gh.nvim',
   requires = { { 'ldelossa/litee.nvim' } }
  }


  -- Discord
  use { 'andweeb/presence.nvim' }
end)


-- Simple plugins can be specified as strings
--[[--
    use 'rstacruz/vim-closer'
    --]]
--

-- Lazy loading:
-- Load on specific commands
--[[--
    use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
    --]]
--

-- Load on an autocommand event
--[[--
    use {'andymass/vim-matchup', event = 'VimEnter'}
    --]]
--

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
    --]]
--


-- Post-install/update hook with call of vimscript function with argument
--[[--
    use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
    --]]
--

-- Use dependency and run lua function after load
--[[--
    use {
        'lewis6991/gitsigns.nvim',
          requires = { 'nvim-lua/plenary.nvim' },
          config = function() require('gitsigns').setup() end
    }
    --]]
--
