require('keys/alias')

nm('<C-h>', '<C-w>h')
nm('<C-j>', '<C-w>j')
nm('<C-k>', '<C-w>k')
nm('<C-l>', '<C-w>l')

nm('ww',':w<cr>')
nm('wq',':wq<cr>')
nm('qq',':q<cr>')

im('ww','<escape>:ww<cr>')
im('wq','<escape>:wq<cr>')
im('qq','<escape>:q<cr>')

im('jk', '<escape>')
im('kj', '<escape>')

vm('<', '<gv')
vm('>', '>gv')


