require 'mason'.setup {
  ui = {
    icons = {
      package_installed = "✓"
    }
  }
}
require 'mason-lspconfig'.setup {
  ensure_installed = { "lua_ls", "pyright", "texlab", "zk", "rust_analyzer", "bashls", "vimls" },
}

-- инициализация LSP для различных ЯП
require 'lspconfig/util'
---[[--
require('mason-tool-installer').setup {
  ensure_installed = {
    'lua-language-server',
    'vim-language-server',
    'bash-language-server',
    'yaml-language-server',
    --'r-languageserver',
    'rust-analyzer',
    'pyright',
    'texlab',
    'zk'
  },
  auto_update = false,
  run_on_start = true,
  debounce_hours = 5, -- минимум 5 часов между попытками установки / обновления
}
--]]--

require 'fidget'.setup {}

local no_format = function(client, bufnr)
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  --client.resolved_capabilities.document_formatting = false
  client.server_capabilities.document_formatting = false
end

--local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true


--require 'lspconfig'.sumneko_lua.setup {
require 'lspconfig'.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        -- path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim', 'use', 'require' },
      },
      ---[[--
      workspace = {
        -- Make the server aware of Neovim runtime files
        --library = vim.api.nvim_get_runtime_file("", true),
        library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true },
      },
      --]]--
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
--]]--
require 'lspconfig'.pyright.setup {
  capabilities = capabilities,
  on_attach = no_format
}
require 'lspconfig'.r_language_server.setup {}
require 'lspconfig'.texlab.setup {} --LaTeX
require 'lspconfig'.zk.setup {} --markdown
require 'lspconfig'.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = no_format
}
--require'lspconfig'.sqls.setup{}
require 'lspconfig'.bashls.setup {}
require 'lspconfig'.vimls.setup {}
