
local O = {}
-- local opts = {
  O.options = {
    icons_enabled = true,
    globalstatus = true,
    theme = "auto",
		always_divide_middle = true,
    component_separators = { left = " ", right = " " },
    section_separators = { left = " ", right = " " },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    -- disabled_filetypes = {
    --   winbar = {},
    --   statusline = {},
    -- },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  }

  O.sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "db_ui#statusline" },
    lualine_c = { { "filename", file_status = true, path = 1 } },
    -- lualine_x = { "encoding", "fileformat", "filetype", "spaces", "encoding"  },
		lualine_x = { "diff",
                  "diagnostics",
                  {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    -- color = { fg = "ff9e64" },
                  },
                },
    lualine_y = { "filetype" },
    lualine_z = { "progress", "location" },
  }

  O.inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  }

  O.tabline = {}
  O.winbar = {}
  O.inactive_winbar = {}
  O.extensions = {}

return O
