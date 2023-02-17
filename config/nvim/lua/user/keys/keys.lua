require('user.keys.alias')

nm('ww', ':w<cr>')
nm('wq', ':wq<cr>')
nm('qq', ':q<cr>')

im('ww', '<escape>:ww<cr>')
im('wq', '<escape>:wq<cr>')
im('qq', '<escape>:q<cr>')

im('jk', '<escape>')
im('kj', '<escape>')

vm('<', '<gv')
vm('>', '>gv')
