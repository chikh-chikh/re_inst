mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim

ln -s /home/ru/reinst/config/nvim/lua/user/ /home/ru/.config/nvim/lua/
nvim +PackerSync
