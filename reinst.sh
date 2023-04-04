#!/bin/bash

# Fetch submodules
git submodule update --init --recursive

# Setup script for Dotfiles
function install_packages {
    echo -e "\u001b[7m Installing required packages... \u001b[0m"
        sudo apt install \
            xauth xorg
            build-essential libreadline-dev unzip curl wget python3 pipx pip3 \
            cmake pkg-config xclip libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev \
            libfontconfig1-dev libxcb-shape0-dev libxcb-xfixes0-dev libxkbcommon-dev
            pulseaudio alsa alsa-utils alsa-tools alsa-oss mplayer mirage rhythmbox moc mpv \
            aptitude nala exa zsh \
            cmus tmux picom fzf htop gh lazygit rofi \
            zathura zathura-pdf-poppler zathura-djvu zathura-ps zathura-cb libreoffice-l10n-ru \
            pandoc pandoc-citeproc \
            atool bat fd-find fasd silversearcher-ag \
            ripgrep xsel ncdu powerline autorandr libnotify-bin \
            locales language-pack-ru console-cyrillic

        # sudo ln -sfnv /usr/bin/fdfind /usr/bin/fd;
        # sudo ln -sfnv /usr/bin/batcat /usr/bin/bat;

        # sudo dpkg-reconfigure console-setup;
        # sudo dpkg-reconfigure locales;

        # localectl set-locale LANG=ru_RU.UTF-8;
}

# function install_ {
#     echo -e "\u001b[7m Installing  \u001b[0m"
#
# }

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
    mv -iv ~/.config/lazygit/          ~/.config/lazygit.old
    # mv -iv ~/.config/    ~/.config/
    # mv -iv ~/.config/    ~/.config/
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
    mkdir -p $HOME/.config
    ln -sfnv "$PWD/config/awesome/"       ~/.config/
    ln -sfnv "$PWD/config/alacritty/"     ~/.config/
    ln -sfnv "$PWD/config/ranger/"        ~/.config/
    ln -sfnv "$PWD/config/rofi/"          ~/.config/
    ln -sfnv "$PWD/config/xplr/"          ~/.config/
    ln -sfnv "$PWD/config/vifm/"          ~/.config/
    ln -sfnv "$PWD/config/zathura/"       ~/.config/
    # ln -sfnv "$PWD/config/nvim/"          ~/.config/
    ln -sfnv "$PWD/config/tmux/"          ~/.config/
    ln -sfnv "$PWD/config/zsh/"           ~/.config/
    ln -sfnv "$PWD/config/htop/"          ~/.config/
    ln -sfnv "$PWD/config/lazygit/"       ~/.config/
    ln -sfnv "$PWD/config/greenclip.cfg"  ~/.config/
    ln -sfnv "$PWD/config/greenclip.toml" ~/.config/

    ln -sfnv "$PWD/zshrc"                 ~/.zshrc
    # ln -sfnv "$PWD/bashrc"                ~/.bashrc
    ln -sfnv "$PWD/profile"               ~/.profile
    ln -sfnv "$PWD/xinitrc"               ~/.xinitrc
    ln -sfnv "$PWD/zshenv"                ~/.zshenv
    ln -sfnv "$PWD/Rprofile"              ~/.Rprofile
    ln -sfnv "$PWD/Renviron"              ~/.Renviron
    # ln -sfnv "$PWD/"                ~/.
    # ln -sfnv "$PWD/"                ~/.
    # ln -sfnv "$PWD/"                ~/.
    # ln -sfnv "$PWD/"                ~/.
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
    mkdir -p $HOME/Downloads
    cd $HOME/Downloads
    curl -R -O http://www.lua.org/ftp/lua-5.3.5.tar.gz
    tar -zxf lua-5.3.5.tar.gz
    cd lua-5.3.5
    make linux test
    sudo make install
    # Luarocks
    echo -e "\u001b[7m Installing Luarocks...\u001b[0m"
    cd $HOME/Downloads/
    wget https://luarocks.org/releases/luarocks-3.8.0.tar.gz
    tar -zxpf luarocks-3.8.0.tar.gz
    cd luarocks-3.8.0
    ./configure --with-lua-include=/usr/local/include
    make
    sudo make install
    # Awesome
    echo -e "\u001b[7m Installing Awesome...\u001b[0m"
    # cd $HOME/downloads/
    sudo apt install awesome awesome-extra

}


function install_alacritty {
    echo -e "\u001b[7m Install Dependens \u001b[0m"
    sudo apt install libfontconfig1-dev libxcb-shape0-dev libxcb-xfixes0-dev libxkbcommon-dev
    echo -e "\u001b[7m Installing Rust \u001b[0m"
    # Rust,Cargo
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source "$HOME/.cargo/env/"
    # Alacritty
    echo -e "\u001b[7m Compiling Alacritty... \u001b[0m"
    # git clone https://github.com/alacritty/alacritty.git
    # cd alacritty
    # cargo build --release
    cargo install alacritty
}

function install_zap_zsh {
    echo -e "\u001b[7m Installing zap-zsh...\u001b[0m"
    zsh -c "$(curl -fsSL https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)" # "" --unattended
    chsh -s $(which zsh)
}

function install_nodejs {
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
    sudo add-apt-repository ppa:c2d4u.team/c2d4u4.0+
    # sudo apt install --no-install-recommends r-cran-tidyverse
    # deb https://<my.favorite.ubuntu.mirror>/ focal-backports main restricted universe
    R --version
}

function install_neovim {
    echo -e "\u001b[7m Installing neovim... \u001b[0m"
    deb-get install neovim;
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 70;
    pip3 install pynvim;
    pip3 install neovim-remote
    npm i -g neovim;

    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
    ln -s $HOME/reinst/config/nvchad/lua/custom $HOME/.config/nvim/lua
}

function install_greenclip {
    echo -e "\u001b[7m Installing greenclip \u001b[0m"
            #Greenclip (rofi clipboard manager)
        wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip
        mv greenclip ~/.local/bin
        chmod 775 ~/.local/bin/greenclip
}

function install_latex {
    echo -e "\u001b[7m Installing latex \u001b[0m"
        sudo apt install texlive
        # sudo apt install texlive-latex-extra
        # sudo apt install texlive-full
        latexmk --version
}

function install_zotero_bibtex {
    echo -e "\u001b[7m Installing zotero  \u001b[0m"
        wget -qO- https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | sudo bash
        sudo apt update
        sudo apt install zotero
        # https://www.zotero.org/download/
        # tar -xvf Zotero*
        # sudo mv ~/Downloads/Zotero_linux-x86_64 /opt/zotero
        # cd /opt/zotero
        # sudo ./set_launcher_icon
        # sudo ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop


    echo -e "\u001b[7m Installing bibtex  \u001b[0m"
        BIBTEX_VERSION=$(curl -s "https://api.github.com/repos/retorquere/zotero-better-bibtex/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
        curl -Lo zotero-better-bibtex${BIBTEX_VERSION}.xpi "https://github.com/retorquere/zotero-better-bibtex/releases/download/v${BIBTEX_VERSION}/zotero-better-bibtex-${BIBTEX_VERSION}.xpi"

        mkdir -p ~/texmf/bibtex/bib
        ln -s $PWD/config/latex/bst ~/texmf/bibtex
}

function install_lazygit {
    echo -e "\u001b[7m Installing  \u001b[0m"
        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar xf lazygit.tar.gz lazygit
        sudo install lazygit /usr/local/bin
        rm -rf lazygit.tar.gz
        lazygit --version
}

function install_file_managers {
    echo -e "\u001b[7m Installing file managers \u001b[0m"
        sudo apt install libjpeg-dev zlib1g-dev python3-dev libxtst-dev nautilus ranger vifm
        pip3 install ./set/ueberzug_18.1.9.orig.tar.gz
        mkdir -p $HOME/.local/bin
        ln -s "$PWD/config/vifm/scripts/vifmrun" $HOME/.local/bin
        ln -s "$PWD/config/vifm/scripts/vifmimg" $HOME/.local/bin
        # pip3 install ranger-fm
        # pipx run --spec ranger-fm ranger
}

function install_fonts {
    echo -e "\u001b[7m Installing fonts \u001b[0m"
        #fonts
        mkdir -p $HOME/Downloads
        cd $HOME/Downloads
        wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
        wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/RobotoMono.zip
        mkdir -p $HOME/.local/share/fonts
        unzip JetBrainsMono.zip -d ~/.local/share/fonts/
        unzip RobotoMono.zip -d ~/.local/share/fonts/
        cp $PWD/set/awesomewm-font.ttf ~/.local/share/fonts/
        sudo fc-cache -fr
}

function install_debget {
    echo -e "\u001b[7m Installing deb-get \u001b[0m"
        #deb-get
        curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get
        deb-get install google-chrome-stable zoom exodus discord flameshot balena-etcher-electron whatsapp-for-linux
}

function install_telegram {
    echo -e "\u001b[7m Installing telegram \u001b[0m"
        #Telegramm
        wget https://telegram.org/dl/desktop/linux
        sudo tar -xpf linux -C /opt
        sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop
        sudo chmod -R 775 /opt/Telegram
}


function all {
    echo -e "\u001b[7m Setting up Dotfiles... \u001b[0m"
    install_packages
    backup_configs
    setup_symlinks
    install_awesome
    install_alacritty
    install_zap_zsh
    install_nodejs
    install_r
    install_neovim
    install_greenclip
    install_latex
    install_zotero_bibtex
    install_lazygit
    install_file_managers
    install_fonts
    install_debget
    install_telegram
    echo -e "\u001b[7m Done! \u001b[0m"
}

function wm {
    echo -e "\u001b[7m Setting up Windows Managers... \u001b[0m"
    install_awesome
    install_fonts
    echo -e "\u001b[7m Done! \u001b[0m"
}

function terminals {
    echo -e "\u001b[7m Setting up Terminals... \u001b[0m"
    install_alacritty
    install_zap_zsh
    install_lazygit
    echo -e "\u001b[7m Done! \u001b[0m"
}

function editors {
    echo -e "\u001b[7m Setting up Editors \u001b[0m"
    install_nodejs
    install_neovim
    install_greenclip
    install_latex
    install_zotero_bibtex
    echo -e "\u001b[7m Done! \u001b[0m"
}

function changers {
    echo -e "\u001b[7m Setting up Changers  \u001b[0m"
    install_file_managers
    install_debget
    install_telegram
    echo -e "\u001b[7m Done! \u001b[0m"
}

if [ "$1" = "--all" -o "$1" = "-a" ]; then
    all
    exit 0
fi

# Menu TUI
echo -e "\u001b[32;1m Setting up Dotfiles...\u001b[0m"

echo -e " \u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
echo -e "  \u001b[34;1m (a) ALL(1-17) \u001b[0m"
echo -e "  \u001b[34;1m (w) WINDOWS MANAGER(4,15) \u001b[0m"
echo -e "  \u001b[34;1m (t) TERMINAL(5,6,13) \u001b[0m"
echo -e "  \u001b[34;1m (e) EDITOR(7,9-12) \u001b[0m"
echo -e "  \u001b[34;1m (f) CHANGERS(14,16,17) \u001b[0m"
echo -e "  \u001b[34;1m (1) Install packages \u001b[0m"
echo -e "  \u001b[34;1m (2) Backup current config \u001b[0m"
echo -e "  \u001b[34;1m (3) Setup symlinks \u001b[0m"
echo -e "  \u001b[34;1m (4) Install awesome \u001b[0m"
echo -e "  \u001b[34;1m (5) Install alacritty \u001b[0m"
echo -e "  \u001b[34;1m (6) Install zap-zsh \u001b[0m"
echo -e "  \u001b[34;1m (7) Install nodejs \u001b[0m"
echo -e "  \u001b[34;1m (8) Install r \u001b[0m"
echo -e "  \u001b[34;1m (9) Install neovim \u001b[0m"
echo -e "  \u001b[34;1m (10) Install greenclip \u001b[0m"
echo -e "  \u001b[34;1m (11) Install latex \u001b[0m"
echo -e "  \u001b[34;1m (12) Install zotero bibtex \u001b[0m"
echo -e "  \u001b[34;1m (13) Install lazygit \u001b[0m"
echo -e "  \u001b[34;1m (14) Install file managers \u001b[0m"
echo -e "  \u001b[34;1m (15) Install fonts \u001b[0m"
echo -e "  \u001b[34;1m (16) Install deb-get \u001b[0m"
echo -e "  \u001b[34;1m (17) Install telegram \u001b[0m"
echo -e "  \u001b[31;1m (*) Anything else to exit \u001b[0m"

echo -en "\u001b[32;1m ==> \u001b[0m"

read -r option

case $option in

"a")
    all
    ;;

"w")
    wm
    ;;

"t")
    terminals
    ;;

"e")
    editors
    ;;

"f")
  changers
    ;;

"1")
    install_packages
    ;;

"2")
    backup_configs
    ;;

"3")
    setup_symlinks
    ;;

"4")
    install_awesome
    ;;

"5")
    install_alacritty
    ;;

"6")
    install_zap_zsh
    ;;

"7")
    install_nodejs
    ;;

"8")
    install_r
    ;;

"9")
    install_neovim
    ;;

"10")
    install_greenclip
    ;;

"11")
    install_latex
    ;;

"12")
    install_zotero_bibtex
    ;;

"13")
    install_lazygit
    ;;

"14")
    install_file_managers
    ;;

"15")
    install_fonts
    ;;

"16")
    install_debget
    ;;

"17")
    install_telegram
    ;;

*)
    echo -e "\u001b[31;1m Invalid option entered, Bye! \u001b[0m"
    exit 0
    ;;
esac

exit 0
