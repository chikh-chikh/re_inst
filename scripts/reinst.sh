#!/bin/bash

# Fetch submodules
git submodule update --init --recursive

# Setup script for Dotfiles
function install_packages {
    echo -e "\u001b[7m Installing required packages... \u001b[0m"
        sudo apt install \
            build-essential libreadline-dev unzip curl wget git python3 \
            aptitude deb-get nala exa cmus picom\
            zsh fzf htop gh rofi\
            zathura zathura-pdf-poppler zathura-djvu zathura-ps zathura-cb libreoffice-l10n-ru \
            mpv atool fzf ag bat fd-find fasd silversearcher-ag \
            ripgrep xsel tmux ncdu powerline autorandr libnotify-bin \
            cmake pkg-config xclip libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev \
            locales language-pack-ru console-cyrillic;

        #deb-get
        deb-get install google-chrome-stable zoom exodus discord

        #Telegramm
        sudo tar -xpf tsetup.4.5.2.tar.xz -C /opt
        sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop
        sudo chmod -R 775 /opt/Telegram

        #Greenclip (rofi clipboard manager)
        wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip
        mv greenclip ~/.local/bin
        chmod 775 ~/.local/bin/greenclip

        sudo ln -sfnv /usr/bin/fdfind /usr/bin/fd;
        sudo ln -sfnv /usr/bin/batcat /usr/bin/bat;
            
        sudo dpkg-reconfigure console-setup;
        sudo dpkg-reconfigure locales;

        localectl set-locale LANG=ru_RU.UTF-8;
            
}

function install_zap_zsh {
    echo -e "\u001b[7m Installing zap-zsh...\u001b[0m"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)" "" --unattended
    chsh -s $(which zsh)

}

function backup_configs {
    echo -e "\u001b[33;1m Backing up existing files... \u001b[0m"
    mv -iv ~/.config/awesome/          ~/.config/awesome.old/      
    mv -iv ~/.config/alacritty/        ~/.config/alacritty.old/    
    mv -iv ~/.config/ranger/           ~/.config/ranger.old/       
    mv -iv ~/.config/rofi/             ~/.config/rofi.old/         
    mv -iv ~/.config/xplr/             ~/.config/xplr.old/         
    mv -iv ~/.config/vifm/             ~/.config/vifm.old/         
    mv -iv ~/.config/zathura/          ~/.config/zathura.old/      
    mv -iv ~/.config/nvim/             ~/.config/nvim.old/          
    mv -iv ~/.config/tmux/             ~/.config/tmux.old/          
    mv -iv ~/.config/zsh/              ~/.config/zsh.old/           
    mv -iv ~/.config/htop/             ~/.config/htop.old/         
    mv -iv ~/.config/greenclip.cfg     ~/.config/greenclip.cfg.old 
    mv -iv ~/.config/greenclip.toml    ~/.config/greenclip.toml.old
    # mv -iv ~/.config/    ~/.config/
    # mv -iv ~/.config/    ~/.config/

    mv -iv ~/.zshrc               ~/.zshrc.old
    # mv -iv ~/.bashrc              ~/.bashrc.old
    mv -iv ~/.profile             ~/.profile.old
    mv -iv ~/.xinitrc             ~/.xinitrc.old
    # mv -iv ~/.            ~/.
    # mv -iv ~/.            ~/.
    # mv -iv ~/.            ~/.
    echo -e "\u001b[36;1m Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old'. \u001b[0m"
}

function setup_symlinks {
    echo -e "\u001b[7m Setting up symlinks... \u001b[0m"
    ln -sfnv "$PWD/config/awesome/"       ~/.config/
    ln -sfnv "$PWD/config/alacritty/"     ~/.config/
    ln -sfnv "$PWD/config/ranger/"        ~/.config/
    ln -sfnv "$PWD/config/rofi/"          ~/.config/
    ln -sfnv "$PWD/config/xplr/"          ~/.config/
    ln -sfnv "$PWD/config/vifm/"          ~/.config/
    ln -sfnv "$PWD/config/zathura/"       ~/.config/
    ln -sfnv "$PWD/config/nvim"           ~/.config/
    ln -sfnv "$PWD/config/tmux"           ~/.config/
    ln -sfnv "$PWD/config/zsh"            ~/.config/
    ln -sfnv "$PWD/config/htop/"          ~/.config/
    ln -sfnv "$PWD/config/greenclip.cfg"  ~/.config/
    ln -sfnv "$PWD/config/greenclip.toml" ~/.config/

    ln -sfnv "$PWD/zshrc"           ~/.zshrc
    # ln -sfnv "$PWD/bashrc"          ~/.bashrc
    ln -sfnv "$PWD/profile"         ~/.profile
    ln -sfnv "$PWD/xinitrc"         ~/.xinitrc
    # ln -sfnv "$PWD/"                ~/.

    # ln -sfnv "$PWD/.bashrc" ~/
    # ln -sfnv "$PWD/.dircolors" ~/
    # ln -sfnv "$PWD/.dmenurc" ~/
    # ln -sfnv "$PWD/.gitconfig" ~/
    # ln -sfnv "$PWD/.gitignore.global" ~/
    # ln -sfnv "$PWD/.p10k.zsh" ~/

}

function install_awesome {
    echo -e "\u001b[7m Installing Lua...\u001b[0m"
    # Lua
    cd $HOME/downloads/
    curl -R -O http://www.lua.org/ftp/lua-5.3.5.tar.gz 
    tar -zxf lua-5.3.5.tar.gz
    cd lua-5.3.5
    make linux test
    sudo make install
    # Luarocks 
    echo -e "\u001b[7m Installing Luarocks...\u001b[0m"
    cd $HOME/downloads/
    wget https://luarocks.org/releases/luarocks-3.8.0.tar.gz
    tar zxpf luarocks-3.8.0.tar.gz
    cd luarocks-3.8.0
    ./configure --with-lua-include=/usr/local/include
    make
    make install
    # Awesome
    echo -e "\u001b[7m Installing Awesome...\u001b[0m"
    # cd $HOME/downloads/
    sudo apt install awesome

}


function install_alacritty {
    echo -e "\u001b[7m Installing Rust \u001b[0m"
    # Rust,Cargo
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    # source "$HOME/.cargo/env/"
    echo -e "\u001b[7m Compiling Alacritty... \u001b[0m"
    # Alacritty
    #git clone https://github.com/alacrytty/alacritty.git
    #cd alacritty
    #cargo build --release
    cargo install alacritty

}

function install_neovim {
    echo -e "\u001b[7m Installing neovim... \u001b[0m"
    deb-get install neovim;
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 70;
    pip3 install pynvim;
    npm i -g neovim;

}

function install_nodejs{
    echo -e "\u001b[7m Installing NodeJS... \u001b[0m"
    # nodejs 
    sudo apt remove nodejs
    sudo apt autoremove
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt install -y nodejs
    node -v
    npm -v

}

function install_r {
    echo -e "\u001b[7m Installing R... \u001b[0m"
    #R
    wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
    gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
    sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/"
    sudo apt-get update
    sudo apt-get install r-base
    sudo apt-get install r-base-dev
    # deb https://<my.favorite.ubuntu.mirror>/ focal-backports main restricted universe
    R --version
}


function setup_dotfiles {
    echo -e "\u001b[7m Setting up Dotfiles... \u001b[0m"
    install_packages
    install_zap_zsh
    backup_configs
    setup_symlinks
    install_awesome
    install_alacritty
    install_neovim
    install_nodejs
    install_r
    echo -e "\u001b[7m Done! \u001b[0m"
}

if [ "$1" = "--all" -o "$1" = "-a" ]; then
    setup_dotfiles
    exit 0
fi

# Menu TUI
echo -e "\u001b[32;1m Setting up Dotfiles...\u001b[0m"

echo -e " \u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
echo -e "  \u001b[34;1m (0) Setup everything \u001b[0m"
echo -e "  \u001b[34;1m (1) Install packages \u001b[0m"
echo -e "  \u001b[34;1m (2) Install zap-zsh \u001b[0m"
echo -e "  \u001b[34;1m (3) Backup current config \u001b[0m"
echo -e "  \u001b[34;1m (4) Setup symlinks \u001b[0m"
echo -e "  \u001b[34;1m (5) Install awesome \u001b[0m"
echo -e "  \u001b[34;1m (6) Install alacritty \u001b[0m"
echo -e "  \u001b[34;1m (7) Install neovim \u001b[0m"
echo -e "  \u001b[34;1m (8) Install nodejs \u001b[0m"
echo -e "  \u001b[34;1m (9) Install r \u001b[0m"
echo -e "  \u001b[31;1m (*) Anything else to exit \u001b[0m"

echo -en "\u001b[32;1m ==> \u001b[0m"

read -r option

case $option in

"0")
    setup_dotfiles
    ;;

"1")
    install_packages
    ;;

"2")
    install_zap_zsh
    ;;

"3")
    backup_configs
    ;;

"4")
    setup_symlinks
    ;;

"5")
    install_awesome
    ;;

"6")
    install_alacritty
    ;;

"7")
    install_neovim
    ;;

"8")
    install_nodejs
    ;;

"9")
    install_r
    ;;

*)
    echo -e "\u001b[31;1m Invalid option entered, Bye! \u001b[0m"
    exit 0
    ;;
esac

exit 0
