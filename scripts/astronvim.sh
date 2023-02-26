#!/bin/sh
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

git clone https://github.com/AstroNvim/AstroNvim $HOME/.config/nvim

nvim +PackerSync

