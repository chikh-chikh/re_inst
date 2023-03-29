Is_Enabled = require("config.functions").is_enabled
return {
  -- {{{ nvim-cmp
  --     TODO: Try to improve nested folds behavior.

  {
    -- {{{ Events and dependencies

    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    enabled = Is_Enabled("nvim-cmp"),

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      -- "hrsh7th/cmp-nvim-lsp-signature-help",
      'hrsh7th/cmp-omni', -- helps Vimtex completions
      "f3fora/cmp-spell",
      { "windwp/nvim-autopairs",
      config = function()
          require "plugins.configs.autopairs"
      end
      },
      'aspeddro/cmp-pandoc.nvim',

      'jalvesaq/cmp-nvim-r',

      'L3MON4D3/LuaSnip', -- движок для снипетов
      "saadparwaiz1/cmp_luasnip", -- автодополнения для сниппетов
      'rafamadriz/friendly-snippets',   -- набор готовых сниппетов для всех языков

      -- { 'tzachar/cmp-tabnine', build = './install.sh' } ,   -- ИИ автодополнения
    },

    config = function()
     require "plugins.configs.cmp"
    end,

    -- --------------------------------------------------------------------- }}}

  },
  -- ----------------------------------------------------------------------- }}}
}

