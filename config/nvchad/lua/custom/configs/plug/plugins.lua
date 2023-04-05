-- Constants = require("custom.configs.constants")
local functions = require("custom.configs.functions")
Is_Enabled = functions.is_enabled


return {

  -- {{{ vim-dadbod-ui

  {
  "kristijanhusak/vim-dadbod-ui",
  enabled = Is_Enabled("vim-dadbod-ui"),
  dependencies = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
    "tpope/vim-dotenv",
  },
  keys = { { "<leader><leader>db", ":tab DBUI<cr>" } },
  init = function()
    require "custom.configs.database"
  end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Nvim-R
  {
  "jalvesaq/Nvim-R",
  enabled = Is_Enabled("nvim-r"),
  lazy = false,
  ft = { "r" },
  -- keys = { { "\rf", "" } },
  -- keys = { "<Bslash>rf" },

  },

  -- ----------------------------------------------------------------------- }}}
-- {{{ undotree
  {
    'mbbill/undotree',
		enabled = Is_Enabled("undotree"),
    cmd = 'UndotreeToggle',
    lazy = true,
    config = function()
      require "custom.configs.undotree"
    end,
  },
	-- ----------------------------------------------------------------------- }}}
  -- {{{ Events and dependencies
  --[[
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    enabled = Is_Enabled("nvim-cmp"),

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      -- "hrsh7th/cmp-nvim-lsp-signature-help",
      'jalvesaq/cmp-nvim-r',
      'hrsh7th/cmp-omni', -- helps Vimtex completions
      "f3fora/cmp-spell",
      'aspeddro/cmp-pandoc.nvim',

      'L3MON4D3/LuaSnip', -- движок для снипетов
      "saadparwaiz1/cmp_luasnip", -- автодополнения для сниппетов
      'rafamadriz/friendly-snippets',   -- набор готовых сниппетов для всех языков

    },
  },
  --]]
  -- --------------------------------------------------------------------- }}}
	-- {{{ vimtex
	{
		"lervag/vimtex",
		ft = { "tex", "texx" },
		enabled = Is_Enabled("vimtex"),
		dependencies = { "Traap/vim-bundle-vimtex" },
    config = function()
      require "custom.configs.vimtex"
    end,
	},

	-- ----------------------------------------------------------------------- }}}
}

