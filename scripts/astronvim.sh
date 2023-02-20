#!/bin/sh
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

git clone https://github.com/AstroNvim/AstroNvim $HOME/.config/nvim

ln -s $HOME/reinst/config/nvim/lua/user/ $HOME/.config/nvim/lua/
nvim +PackerSync

