require 'mason'.setup {
  ui = {
    icons = {
      package_installed = "✓"
    }
  }
}
require 'mason-lspconfig'.setup {
  ensure_installed = { "sumneko_lua", "pyright", "texlab", "zk", "rust_analyzer", "bashls", "vimls" },
}

-- инициализация LSP для различных ЯП
require 'lspconfig/util'


local no_format = function(client, bufnr)
  --client.resolved_capabilities.document_formatting = false
  client.server_capabilities.document_formatting = false
end

--local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true


require 'lspconfig'.sumneko_lua.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim', 'use', 'require' },
      },
      ---[[--
      workspace = {
        -- Make the server aware of Neovim runtime files
        --library = vim.api.nvim_get_runtime_file("", true),
        library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true },
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
