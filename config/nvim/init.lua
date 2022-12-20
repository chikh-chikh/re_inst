vim.api.nvim_set_keymap('i','jk','ESC', { noremap = true })

require("base/settings")
require("base/search")
require("base/tabs")
--require('base/other')

require("plugins/packer_install") -- To read packer.nvim
require("plugins/gruvbox")
require("plugins/nvim-tree")
require("plugins/nvim-treesitter")
require("plugins/bufferline")
require("plugins/lsp-installer")
--require("plugins/cmp")
--require("plugins/lualine")

--require('keys/alias')
require("keys/plugins")
--

