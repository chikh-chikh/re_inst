local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- Personal normal keybindings
    -- ['<C-h>'] = { "<C-w>h", "", opts = {nowait = true} },
    -- ['<C-j>'] = { "<C-w>j", "", opts = {nowait = true} },
    -- ['<C-k>'] = { "<C-w>k", "", opts = {nowait = true} },
    -- ['<C-l>'] = { "<C-w>l", "", opts = {nowait = true} },
    ["ww"] = { ":w<cr>", "write", opts = {nowait = true} },
    ["wq"] = { ":wq<cr>", "write and quit", opts = {nowait = true} },
    ["qq"] = { ":q<cr>", "quit", opts = {nowait = true} },
    -- Bdelete
    ["<leader>d"] = { ":bd!<CR>", "close buffer", opts = {nowait = true} },
    -- Navigate buffers
    ["<S-l>"] = {":bnext<CR>", "buffer next", opts = {nowait = true} },
    ["<S-h>"] = {":bprevious<CR>", "buffer prev", opts = {nowait = true} },
    -- Move text up and down
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "change with down string", opts = {nowait = true} },
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "change with up string", opts = {nowait = true} },
    -- Resize with arrows
    ["<C-Up>"] = { ":resize -2<CR>", "resize up", opts = {nowait = true} },
    ["<C-Down>"] = { ":resize +2<CR>", "resize down", opts = {nowait = true} },
    ["<C-Left>"] = { ":vertical resize +2<CR>", "resize left", opts = {nowait = true} },
    ["<C-Right>"] = { ":vertical resize -2<CR>", "resize right", opts = {nowait = true} },
    -- lists navigation
    -- ["<leader>j"] = { ":cnext<CR>zz", "", opts = {nowait = true} },
    -- ["<leader>k"] = { ":cprev<CR>zz", "", opts = {nowait = true} },
    -- ["<leader>i"] = { ":lnext<CR>zz", "", opts = {nowait = true} },
    -- ["<leader>o"] = { ":lprev<CR>zz", "", opts = {nowait = true} },
    -- ["<leader>cc"] = { ":cclose<CR>", "", opts = {nowait = true} },
    -- quick split
    -- ["<leader>wsv"] = { ":vsp<CR>", "", opts = {nowait = true} },
    -- search result focus
    ["n"] = { "nzzzv", "replace search result", opts = {nowait = true} },
    ["N"] = { "Nzzzv", "replace srarch result", opts = {nowait = true} },
    -- join lines focus
    ["J"] = { "mzJ`z", "concatenate string", opts = {nowait = true} },
    --- quick env file edit
    -- ["<leader>ee"] = { ":vsp .env<CR>", "", opts = {nowait = true} },
  },
  -- Insert --
  i = {
    -- Press jk fast to enter
    ["jk"] = {"<escape>", "quit insert mode", opts = {nowait = true} },
    ["kj"] = {"<escape>", "quit insert mode", opts = {nowait = true} },

    ["ww"] = {"<escape>:ww<cr>", "write", opts = {nowait = true} },
    ["wq"] = {"<escape>:wq<cr>", "write and quit", opts = {nowait = true} },
    ["qq"] = {"<escape>:q<cr>", "quite", opts = {nowait = true} },
  },
  -- Visual --
  v = {
    -- tabulation
    ["<"] = {"<gv", "tab del", {nowait = true} },
    [">"] = {">gv", "tab add", {nowait = true} },
    -- Move text up and down
    ["<A-j>"] = {":m .+1<CR>==", "move down", {nowait = true} },
    ["<A-k>"] = {":m .-2<CR>==", "move up", {nowait = true} },

    ["P"] = {'"_dP','', {nowait = true} },
    ["p"] = {'"_dp', '', {nowait = true} },

  },
  -- Terminal --
  t = {
    ["<Esc><Esc>"] = {"<C-\\><C-n>","", {nowait = true} },
    ["<C-h>"] = {"<c-\\><c-n><c-w>h","", {nowait = true} },
    ["<C-j>"] = {"<c-\\><c-n><c-w>j","", {nowait = true} },
    ["<C-k>"] = {"<c-\\><c-n><c-w>k","", {nowait = true} },
    ["<C-l>"] = {"<c-\\><c-n><c-w>l","", {nowait = true} },
  },
  --Visual Block --
  x = {
    --Move text up and down
    ["J"] = {":move '>+1<CR>gv-gv","", {nowait = true} },
    ["K"] = {":move '<-2<CR>gv-gv","", {nowait = true} },
    ["<A-j>"] = {":move '>+1<CR>gv-gv","", {nowait = true} },
    ["<A-k>"] = {":move '<-2<CR>gv-gv","", {nowait = true} },
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
