---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.plugins = {
  n = {
    ["<leader>e"] = {"<cmd> NvimTreeToggle <CR>", "Toggle nvimtree"},
    ["<leader>r"] = {"<cmd> RnvimrToggle <CR>", "Ranger"},
    -- ["<leader>ff"] = {"<cmd> Telescope <CR>", "Telescope"},
  },
}
-- more keybinds!

return M
