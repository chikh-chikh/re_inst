Is_Enabled = require("config.functions").is_enabled

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
    require "plugins.configs.database"
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

}



