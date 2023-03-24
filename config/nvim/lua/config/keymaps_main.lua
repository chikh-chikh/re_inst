
Keymap("n", '<C-h>', '<C-w>h')
Keymap("n", '<C-j>', '<C-w>j')
Keymap("n", '<C-k>', '<C-w>k')
Keymap("n", '<C-l>', '<C-w>l')

Keymap("n", 'ww',':w<cr>')
Keymap("n", 'wq',':wq<cr>')
Keymap("n", 'qq',':q<cr>')

-- Resize with arrows
Keymap("n", "<C-Up>", ":resize -2<CR>")
Keymap("n", "<C-Down>", ":resize +2<CR>")
Keymap("n", "<C-Left>", ":vertical resize +2<CR>")
Keymap("n", "<C-Right>", ":vertical resize -2<CR>")

-- Navigate buffers
Keymap("n", "<S-l>", ":bnext<CR>")
Keymap("n", "<S-h>", ":bprevious<CR>")

-- Move text up and down
Keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
Keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Personal normal keybindings
Keymap("n", "<leader><CR>", ":noh<CR>")     -- clears highlights
-- Insert --
-- Press jk fast to enter
Keymap("i", 'jk', '<escape>')
Keymap("i", 'kj', '<escape>')

Keymap("i", 'ww','<escape>:ww<cr>')
Keymap("i", 'wq','<escape>:wq<cr>')
Keymap("i", 'qq','<escape>:q<cr>')


-- Visual --
-- Stay in indent mode
Keymap("v", "<", "<gv")
Keymap("v", ">", ">gv")

-- Move text up and down
Keymap("v", "<A-j>", ":m .+1<CR>==")
Keymap("v", "<A-k>", ":m .-2<CR>==")
Keymap("v", "p", '"_dP')


-- Terminal --
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

