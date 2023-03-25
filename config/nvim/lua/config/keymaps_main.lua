-- Personal normal keybindings
Keymap("n", "<leader><CR>", ":noh<CR>")     -- clears highlights

Keymap("n", '<C-h>', '<C-w>h')
Keymap("n", '<C-j>', '<C-w>j')
Keymap("n", '<C-k>', '<C-w>k')
Keymap("n", '<C-l>', '<C-w>l')

Keymap("n", 'ww',':w<cr>')
Keymap("n", 'wq',':wq<cr>')
Keymap("n", 'qq',':q<cr>')

-- Navigate buffers
Keymap("n", "<S-l>", ":bnext<CR>")
Keymap("n", "<S-h>", ":bprevious<CR>")

-- Move text up and down
Keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
Keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Resize with arrows
Keymap("n", "<C-Up>", ":resize -2<CR>")
Keymap("n", "<C-Down>", ":resize +2<CR>")
Keymap("n", "<C-Left>", ":vertical resize +2<CR>")
Keymap("n", "<C-Right>", ":vertical resize -2<CR>")

-- lists navigation
Keymap("n", "<leader>j", ":cnext<CR>zz")
Keymap("n", "<leader>k", ":cprev<CR>zz")
Keymap("n", "<leader>i", ":lnext<CR>zz")
Keymap("n", "<leader>o", ":lprev<CR>zz")
Keymap("n", "<leader>cc", ":cclose<CR>")

Keymap("n", "<leader>bd", ":bd!<CR>")

-- quick split
Keymap("n", "<leader>wsv", ":vsp<CR>")

-- search result focus
Keymap("n", "n", "nzzzv")
Keymap("n", "N", "Nzzzv")

-- join lines focus
Keymap("n", "J", "mzJ`z")

--- quick env file edit
Keymap("n", "<leader>ee", ":vsp .env<CR>")

-- symbols to add undo points
local symbols = { ",", ".", "!", "?", "$", ">", "<" }
for _, symbol in pairs(symbols) do
  Keymap("i", symbol, symbol .. "<c-g>u")
end

-- Insert --
-- Press jk fast to enter
Keymap("i", 'jk', '<escape>')
Keymap("i", 'kj', '<escape>')

Keymap("i", 'ww','<escape>:ww<cr>')
Keymap("i", 'wq','<escape>:wq<cr>')
Keymap("i", 'qq','<escape>:q<cr>')

-- Visual --
-- tabulation
Keymap("v", "<", "<gv")
Keymap("v", ">", ">gv")

-- Move text up and down
Keymap("v", "<A-j>", ":m .+1<CR>==")
Keymap("v", "<A-k>", ":m .-2<CR>==")
Keymap("v", "p", '"_dP')

Keymap("v", "<leader>p", '"_dp')

-- Terminal --
Keymap("t", "<Esc><Esc>", "<C-\\><C-n>")
Keymap("t", "<C-h>","<c-\\><c-n><c-w>h" )
Keymap("t", "<C-j>","<c-\\><c-n><c-w>j" )
Keymap("t", "<C-k>","<c-\\><c-n><c-w>k" )
Keymap("t", "<C-l>","<c-\\><c-n><c-w>l" )

-- --Visual Block --
-- --Move text up and down
-- Keymap("x", "J", ":move '>+1<CR>gv-gv")
-- Keymap("x", "K", ":move '<-2<CR>gv-gv")
-- Keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
-- Keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

