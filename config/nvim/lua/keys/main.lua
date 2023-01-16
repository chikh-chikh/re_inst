require('keys/alias')

-- Назначает дополнительной клавишей для отключения режима Ctrl + K
im('jk', '<escape>')

im('wq','<escape>:wq<cr>')
im('qq','<escape>:q<cr>')

nm('ww',':w<cr>')
nm('wq',':wq<cr>')
nm('qq',':q<cr>')

nm('<C-h>', '<C-w>h')
nm('<C-j>', '<C-w>j')
nm('<C-k>', '<C-w>k')
nm('<C-l>', '<C-w>l')

vm('<', '<gv')
vm('>', '>gv')

tm('`', "<C-d>")

