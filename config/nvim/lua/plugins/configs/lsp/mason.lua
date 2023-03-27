local servers = {
	"pyright",
  -- "r_language_server",
	"lua_ls",
  -- "texlab",
  -- "zk",
  -- "rust_analyzer",
  "bashls",
  "vimls",
	-- "cssls",
	-- "html",
	-- "tsserver",
	-- "jsonls",
	-- "yamlls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = false,
})

-- статус загрузки LSP
require 'fidget'.setup {}

-- инициализация LSP для различных ЯП
require 'lspconfig/util'
---[[--
require('mason-tool-installer').setup {
  ensure_installed = {
    'lua-language-server',
    'vim-language-server',
    'bash-language-server',
    -- 'yaml-language-server',
    -- 'r-languageserver',
    -- 'rust-analyzer',
    'pyright',
    -- 'texlab',
    -- 'zk'
  },
  auto_update = false,
  run_on_start = false,
  debounce_hours = 1, -- минимум 5 часов между попытками установки / обновления
}
--]]--

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("plugins/configs/lsp/handlers").on_attach,
		capabilities = require("plugins/configs/lsp/handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
