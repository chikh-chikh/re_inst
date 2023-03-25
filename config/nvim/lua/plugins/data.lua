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
    require "setup.database"
  end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Nvim-R
  {
  "jalvesaq/Nvim-R",
  enabled = Is_Enabled("nvim-r"),
  ft = { "r" },
  -- keys = { { "\rf", "" } },
  -- init = function()
  --   require "setup.nvim-r"
  -- end,
  },

  -- ----------------------------------------------------------------------- }}}

}



