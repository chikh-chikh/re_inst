local plugins = {
    -- Plugin Manager, load first
    'lazy',

    -- Keybindings
    'which-key',

    -- Appearance and UI
    'gruvbox',
    'bufferline',
    -- 'colorizer',
    -- 'indentline',
    -- 'notify',

    -- Utilities
    'gh',
    'gitsigns',
    'diffview',
    -- 'neogit',
    -- 'tmux',
    'nvim-tree',
    'telescope',
    'toggleterm',
    'treesitter-context',
    'treesitter',

    -- LSP Stuff
    -- 'mason',
    -- 'lsp',
    -- 'cmp',
    -- 'null-ls',
    -- 'lsp-lines',
    -- 'lsp-signature',
    -- 'lspsaga',
    'lualine',

    -- Editing
    'autopairs',
    'comment',
    -- 'refactoring',
    -- 'surround',
    -- 'presence',
    -- 'undotree',
    -- 'vimtex'
}
---[[--
local errors = {}
local error_plugins = {}
---[[--
for _, plugin in pairs(plugins) do
    local no_errors, err_msg =  pcall(require, 'plugins.' .. plugin)
    if not no_errors then
        table.insert(errors, err_msg)
        table.insert(error_plugins, plugin)
    end
end

for i, err_msg in pairs(errors) do
    vim.notify(err_msg, vim.log.levels.ERROR, {
        title = 'Error loading : ' .. error_plugins[i],
    })
end
--]]--
