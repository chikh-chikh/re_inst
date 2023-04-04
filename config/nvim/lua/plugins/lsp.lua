
Is_Enabled = require("config.functions").is_enabled
Constants = require "config.constants"
return {
  -- {{{ mason.nvim

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    enabled = Is_Enabled("mason.nvim"),
    keys = { { "<leader>cm", "<cmd>Mason<cr> " } },
    opts = {
      ensure_installed = Constants.ensure_installed.mason,
     	ui = {
        border = "none",
        icons = Constants.icons.mason,
        keymaps = {
          toggle_server_expand = "<CR>",
          install_server = "i",
          update_server = "u",
          check_server_version = "c",
          update_all_servers = "U",
          check_outdated_servers = "C",
          uninstall_server = "X",
          cancel_installation = "<C-c>",
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    },

    dependencies = {

      { "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = Constants.ensure_installed.lsp_config,
          automatic_installation = false,
        },
      },

      { "j-hui/fidget.nvim",
        opts = {
          -- window = {
          --   blend = 0,
          -- },
          -- sources = {
          --   ["null-ls"] = {
          --     ignore = true,
          --   },
          -- },
        },
      },
    },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ nvim-lspconfig

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    enabled = Is_Enabled("nvim-lspconfig"),
    opts = function(_, opts)
      opts.servers = {
        ansiblels = {},
        astro = {},
        bashls = {},
        clangd = {},
        cssls = {},
        denols = false,
        dockerls = {},
        gopls = {},
        html = {},
        jsonls = {},
        marksman = {},
        pyright = {},
        svelte = {},
        tsserver = {},
        yamlls = {},

        lua_ls = {
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  "--log-level=trace",
                },
              },
              diagnostics = {
                enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },

        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              procMacro = { enable = true },
              cargo = { allFeatures = true },
              checkOnSave = {
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
            },
          },
        },
      }
    end,
  },
  -- ----------------------------------------------------------------------- }}}
}

