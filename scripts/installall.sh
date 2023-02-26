#!/bin/sh

sudo apt install lightdm build-essential libreadline-dev unzip curl wget git
# Lua, luarocks, awesome

curl -R -O http://www.lua.org/ftp/lua-5.3.5.tar.gz
tar -zxf lua-5.3.5.tar.gz
cd lua-5.3.5
make linux test
sudo make install

wget https://luarocks.org/releases/luarocks-3.8.0.tar.gz
tar zxpf luarocks-3.8.0.tar.gz
cd luarocks-3.8.0
./configure --with-lua-include=/usr/local/include
make
make install

sudo apt install awesome

# Rust,Cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"

# Alacrytty
sudo apt install cmake pkg-config xclip libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 #libegl1-mesa-dev

#git clone https://github.com/alacrytty/alacritty.git
#cd alacritty
#cargo build --release

cargo install alacritty

sudo apt install zsh
chsh -s $(which zsh)

# NeoVim
sudo apt-get install neovim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 70

sudo apt install xsel
pip install pynvim
npm i -g neovim
sudo apt install ripgrep

# Ranger
sudo apt install ranger 

sudo apt install aptitude deb-get nala

sudo apt install exa

sudo apt install zathura zathura-pdf-poppler zathura-djvu zathura-ps zathura-cb
sudo apt install mpv atool fzf ag
sudo apt-get install locales
sudo apt install language-pack-ru
localectl set-locale LANG=ru_RU.UTF-8
localectl status

sudo dpkg-reconfigure locales

sudo apt-get install libreoffice-l10n-ru
sudo dpkg-reconfigure console-setup
sudo apt install console-cyrillic -y

sudo tar -xpf tsetup.4.5.2.tar.xz -C /opt
sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop
sudo chmod -R 775 /opt/Telegram

