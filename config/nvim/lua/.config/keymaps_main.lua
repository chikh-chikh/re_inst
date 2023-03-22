require('config/alias')

nm('<C-h>', '<C-w>h')
nm('<C-j>', '<C-w>j')
nm('<C-k>', '<C-w>k')
nm('<C-l>', '<C-w>l')

nm('ww',':w<cr>')
nm('wq',':wq<cr>')
nm('qq',':q<cr>')

-- Resize with arrows
nm("<C-Up>", ":resize -2<CR>")
nm("<C-Down>", ":resize +2<CR>")
nm("<C-Left>", ":vertical resize +2<CR>")
nm("<C-Right>", ":vertical resize -2<CR>")

-- Navigate buffers
nm("<S-l>", ":bnext<CR>")
nm("<S-h>", ":bprevious<CR>")

-- Move text up and down
nm("<A-j>", "<Esc>:m .+1<CR>==gi")
nm("<A-k>", "<Esc>:m .-2<CR>==gi")

-- Personal normal keybindings
nm("<leader><CR>", ":noh<CR>")     -- clears highlights
-- Insert --
-- Press jk fast to enter
im('jk', '<escape>')
im('kj', '<escape>')

im('ww','<escape>:ww<cr>')
im('wq','<escape>:wq<cr>')
im('qq','<escape>:q<cr>')


-- Visual --
-- Stay in indent mode
vm("<", "<gv")
vm(">", ">gv")

-- Move text up and down
vm("<A-j>", ":m .+1<CR>==")
vm("<A-k>", ":m .-2<CR>==")
vm("p", '"_dP')

tm("<C-h>","<c-\\><c-n><c-w>h" )
tm("<C-j>","<c-\\><c-n><c-w>j" )
tm("<C-k>","<c-\\><c-n><c-w>k" )
tm("<C-l>","<c-\\><c-n><c-w>l" )
-- Visual Block --
-- Move text up and down
-- xm("J", ":move '>+1<CR>gv-gv")
-- xm("K", ":move '<-2<CR>gv-gv")
-- xm("<A-j>", ":move '>+1<CR>gv-gv")
-- xm("<A-k>", ":move '<-2<CR>gv-gv")

