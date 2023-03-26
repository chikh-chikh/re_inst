Constants = require("config.constants")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

return {
  -- {{{ alpha-nvim

  {
    "goolord/alpha-nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("alpha-nvim"),
    lazy = false,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ dressing

  {
    "stevearc/dressing.nvim",
    enabled = Is_Enabled("dressing"),
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Git signs and lightbulb.

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    enabled = Is_Enabled("gitsigns.nvim"),
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require"plugins.setup.gitsigns"
    end
  },

  {
    "kosayoda/nvim-lightbulb",
    event = "BufReadPre",
    opts = { autocmd = { enabled = true } },
    dependencies = { "antoinemadec/FixCursorHold.nvim" },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Indent guides for Neovim

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("indent-blankline"),
    opts = function(_, opts)
      if Use_Defaults("indent-blankline") then
        -- Use LazyVim default setup.
        opts = {}
      else
        -- Use my customizations.
        opts.char = "│"
        opts.filetype_exclude = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
        }
        opts.show_trailing_blankline_indent = false
        opts.show_current_context = false
      end
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ lualine.nvim

  {
    "nvim-lualine/lualine.nvim",
    enabled = Is_Enabled("lualine.nvim"),
    lazy = false,
    opts = function(_, opts)
      if Use_Defaults("lualine.nvim") then
        -- Use LazyVim default setup.
        opts = {}
      else
            ---- Use my customizations.
        opts = require "plugins.setup.lln"
            ----or
        -- opts.options              = require("setup.lualine").options
        -- opts.sections             = require("setup.lualine").sections
        -- opts.inactive_sections    = require("setup.lualine").inactive_sections
        -- opts.tabline              = require("setup.lualine").tabline
        -- opts.winbar               = require("setup.lualine").winbar
        -- opts.inactive_winbar      = require("setup.lualine").inactive_winbar
        -- opts.extensions           = require("setup.lualine").extensions
      end
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ markdown-perview.nvim

  {
    "iamcco/markdown-preview.nvim",
    ft = "md",
    enabled = Is_Enabled("markdown-preview.nvim"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ noice.nvim - Noice - (Nice, Noise, Notice)

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = Is_Enabled("noice.nvim"),
    keys = false,
    opts = function(_, opts)
      if Use_Defaults("noice.nvim") then
        -- Use LazyVim default setup.
        opts = {}
      else
        -- Use my customizations.
        opts.presets = {
          bottom_search = false,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        }

        opts.cmdline_popup = {
          views = {
            position = {
              row = "50%",
              col = "50%",
            },
            win_options = {
              winhighlight = "NormalFloat:NormalFloat, FloatBorder:FloatBorder",
            },
          },
        }

        opts.lsp = {
          progress = {
            view = "notify",
          },
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
            ["vim.lsp.util.stylize_markdown"] = false,
            ["cmp.entry.get_documentation"] = false,
          },
        }

        opts.routes = {
          {
            filter = {
              event = "msg_show",
              kind = "",
            },
            opts = { skip = true },
          },

          {
            filter = {
              event = "msg_show",
              kind = "wmsg",
            },
            opts = { skip = true },
          },
        }
      end
    end,

    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-notify

  {
    "rcarriga/nvim-notify",
    event = "BufEnter",
    enabled = Is_Enabled("nvim-notify"),
    opts = {
      background_colour = "#1a1b26",
      level = 3,
      render = "minimal",
      timeout = 1500,
      top_down = false,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Popup.nvim

  {
    "nvim-lua/popup.nvim",
    event = "VimEnter",
    enabled = Is_Enabled("popup.nvim"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ trouble.nvim

  {
    "folke/trouble.nvim",
    event = "VimEnter",
    enabled = Is_Enabled("trouble.nvim"),
    opts = { use_diagnostic_signs = true },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-most-minimal-folds

  {
    "vim-utils/vim-most-minimal-folds",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("vim-most-minimal-folds"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ virtcolumn.nvim

  {
    "xiyaowong/virtcolumn.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = Is_Enabled("virtcolumn.nvim"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Which-key

  {
    "folke/which-key.nvim",
    -- event = "VeryLazy",
    enabled = Is_Enabled("which-key.nvim"),
    lazy = false,
    keys = { "<leader>" },

  },

  -- ----------------------------------------------------------------------- }}}
}
