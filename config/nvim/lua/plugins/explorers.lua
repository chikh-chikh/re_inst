Is_Enabled = require("config.functions").is_enabled
Constants = require("config.constants")

return {
  -- {{{ bufferline

  {
    "akinsho/bufferline.nvim",
    enabled = Is_Enabled("bufferline.nvim"),
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    },
    opts = {
      -- options = require ("lua/setup/bufferline")
      options = require "setup.bufferline",
      -- options = {
      --   diagnostics = "nvim_lsp",
      --   always_show_bufferline = false,
      --   diagnostics_indicator = function(_, _, diag)
      --     local icons = require("lazyvim.config").icons.diagnostics
      --     local ret = (diag.error and icons.Error .. diag.error .. " " or "")
      --       .. (diag.warning and icons.Warn .. diag.warning or "")
      --     return vim.trim(ret)
      --   end,
      --   offsets = {
      --     {
      --       -- filetype = "neo-tree",
      --       filetype = "NvimTree",
      --       -- text = "Neo-tree",
      --       text = "",
      --       padding = 1,
      --       highlight = "Directory",
      --       text_align = "left",
      --     },
      --   },
      -- },
    },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ gem-browse

  {
    "tpope/gem-browse",
    event = { "BufEnter *.rb", "BufEnter *.gemspec", "BufEnter Gemfile" },
    enabled = Is_Enabled("gem-browse"),
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-neo-tree

  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = Is_Enabled("neo-tree.nvim"),
    cmd = "Neotree",
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    -- keys = function() return {} end,
    -- keys = { "<c-e>" },
    keys = false,
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
      },
      window = {
        position = "left",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -------------------------------------------------------------------------- }}}
  -- {{{ nvim-tree

  {
    "kyazdani42/nvim-tree.lua",
    enabled = Is_Enabled("nvim-tree"),

    cmd = {
      "NvimTreeFindFile",
      "NvimTreeRefresh",
      "NvimTreeToggle",
    },

    -- keys = { "<c-e>" },
    keys = false,
    opts = {
      filters = {
        custom = { ".git" },
      },
      view = {
        side = "left",
        width = 30,
      },
    },
  },

  -------------------------------------------------------------------------- }}}
  -- {{{ nvim-web-devicons

  {
    "nvim-tree/nvim-web-devicons",
    enabled = Is_Enabled("nvim-web-devicons")
      and (Is_Enabled("nvim-tree") or Is_Enabled("lualine.nvim")),
    opts = {
      override = Constants.icons.web_devicons,
    },
  },

  -------------------------------------------------------------------------- }}}
}
