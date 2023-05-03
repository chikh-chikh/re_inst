#!/bin/bash

# Fetch submodules
# git submodule update --init --recursive

# Setup script for Dotfiles
function install_packages {
	echo -e "\u001b[7m Installing required packages... \u001b[0m"
	sudo apt install \
		xauth xorg \
		build-essential libreadline-dev unzip curl wget python3 pipx \
		cmake pkg-config xclip libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev \
		libxml2-dev \
		libfontconfig1-dev libxcb-shape0-dev libxcb-xfixes0-dev libxkbcommon-dev \
		connman cmst connman-gtk connman-ui \
		pulseaudio alsa alsa-utils alsa-tools alsa-oss mplayer mirage rhythmbox moc mpv \
		aptitude nala exa zsh \
		cmus tmux picom fzf htop gh rofi \
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

dirExists() {
	[[ -d "$1" ]] && [[ ! -L "$1" ]]
}

fileExists() {
	[[ -f "$1" ]] && [[ ! -L "$1" ]]
}

DOTHOME=$HOME/REPOS/reinst
DOT_CFG_PATH=$DOTHOME/config
HOME_CFG_PATH=$HOME/.config
# HOME_CFG_PATH=$DOTHOME/test

DOT_CFG_DIRS=$(ls -l $DOT_CFG_PATH | grep '^d' | awk '{print $9}')
DOT_CFG_FILES=$(ls -l $DOT_CFG_PATH | grep -v '^d' | awk '{print $9}')
DOT_HOME_FILES=$(ls -l $DOTHOME/home | grep -v '^d' | awk '{print $9}')

function backup_configs {
	# делает бекапы только тех пользовательских конфикураций, файлы которых есть в ./config ./home
	echo -e "\u001b[33;1m Backing up existing files... \u001b[0m"
	for dir in ${DOT_CFG_DIRS}; do
		if dirExists ${HOME_CFG_PATH}/${dir}; then
			echo -e "${YELLOW}Moving old config dir to ${HOME_CFG_PATH}/${dir}.old${RC}"
			if ! mv -iv ${HOME_CFG_PATH}/${dir} ${HOME_CFG_PATH}/${dir}.old; then
				echo -e "${RED}Can't move the old config dir!${RC}"
				exit 1
			fi
		fi
	done

	for file in $DOT_CFG_FILES; do
		if fileExists $HOME_CFG_PATH/$file; then
			echo -e "${YELLOW}Moving old config file ${HOME_CFG_PATH}/${file}.old${RC}"
			if ! mv -iv ${HOME_CFG_PATH}/${file} ${HOME_CFG_PATH}/${file}.old; then
				echo -e "${RED}Can't move the old config file!${RC}"
				exit 1
			fi
		fi
	done

	for file in $DOT_HOME_FILES; do
		if fileExists $HOME/.$file; then
			echo -e "${YELLOW}Moving old config file ${HOME}/.${file}.old${RC}"
			if ! mv -iv ${HOME}/.${file} ${HOME}/.${file}.old; then
				echo -e "${RED}Can't move the old config file!${RC}"
				exit 1
			fi
		fi
	done

	echo -e "\u001b[36;1m Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old'. \u001b[0m"
}

function setup_symlinks {
	echo -e "\u001b[7m Setting up symlinks... \u001b[0m"
	mkdir -p ~/.config

	for dirs in ${DOT_CFG_DIRS}; do
		ln -svnf ${DOT_CFG_PATH}/$dirs ${HOME_CFG_PATH}/$dirs
	done

	for file in ${DOT_CFG_FILES}; do
		ln -svnf ${DOT_CFG_PATH}/${file} ${HOME_CFG_PATH}/${file}
	done

	for file in ${DOT_HOME_FILES}; do
		ln -svnf ${DOTHOME}/home/${file} ${HOME}/.${file}
	done
}

function clone_repo_wm {
	echo -e "\u001b[7m Cloning repo...\u001b[0m"

	mkdir -p ~/REPOS/wm
	git clone https://github.com/RU927/wm ~/REPOS/wm
	bash ~/REPOS/wm/install_wm.sh

	# git remote add origin git@github.com:RU927/wm
}
function clone_repo_editors {
	echo -e "\u001b[7m Cloning repo...\u001b[0m"

	mkdir -p ~/REPOS/editors
	git clone https://github.com/RU927/editors ~/REPOS/editors
	bash ~/REPOS/editors/install_editors.sh

	# git remote add origin git@github.com:RU927/editors
}

function install_alacritty {
	echo -e "\u001b[7m Install Dependens \u001b[0m"
	sudo apt install libfontconfig1-dev libxcb-shape0-dev libxcb-xfixes0-dev libxkbcommon-dev
	echo -e "\u001b[7m Installing Rust \u001b[0m"
	# Rust,Cargo
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	source "~/.cargo/env/"
	# Alacritty
	echo -e "\u001b[7m Compiling Alacritty... \u001b[0m"
	# git clone https://github.com/alacritty/alacritty.git
	# cd alacritty
	# cargo build --release
	cargo install alacritty
}

function install_sheldon {

	echo -e "\u001b[7m Compiling Sheldon...\u001b[0m"
	cargo install sheldon
	sheldon lock

	chsh -s $(which zsh)
}

function install_r {
	echo -e "\u001b[7m Installing R... \u001b[0m"
	#R
	wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
	gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
	sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/"
	sudo apt-get update
	sudo apt-get install r-base
	sudo apt-get install r-base-dev libxml2-dev
	sudo add-apt-repository ppa:c2d4u.team/c2d4u4.0+
	# sudo apt install --no-install-recommends r-cran-tidyverse
	# deb https://<my.favorite.ubuntu.mirror>/ focal-backports main restricted universe
	R --version
}

function install_lazygit {
	echo -e "\u001b[7m Installing  \u001b[0m"
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" |
		grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_\
          ${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
	rm -rf lazygit.tar.gz
	lazygit --version
}

function install_file_managers {
	echo -e "\u001b[7m Installing file managers \u001b[0m"
	sudo apt install libjpeg-dev zlib1g-dev python3-dev libxtst-dev nautilus ranger vifm
	pip3 install ./set/ueberzug_18.1.9.orig.tar.gz
	mkdir -p ~/.local/bin
	ln -s "$PWD/config/vifm/scripts/vifmrun" ~/.local/bin
	ln -s "$PWD/config/vifm/scripts/vifmimg" ~/.local/bin
	# pip3 install ranger-fm
	# pipx run --spec ranger-fm ranger
}

function install_fonts {
	echo -e "\u001b[7m Installing fonts \u001b[0m"
	#fonts
	mkdir -p ~/Downloads
	cd ~/Downloads
	# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/RobotoMono.zip
	mkdir -p ~/.local/share/fonts
	# unzip JetBrainsMono.zip -d ~/.local/share/fonts/
	unzip RobotoMono.zip -d ~/.local/share/fonts/
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

function install_greenclip {
	echo -e "\u001b[7m Installing greenclip \u001b[0m"
	#Greenclip (rofi clipboard manager)
	wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip
	mkdir -p ~/.local/bin
	mv greenclip ~/.local/bin
	chmod 775 ~/.local/bin/greenclip
}

function all {
	echo -e "\u001b[7m Setting up Dotfiles... \u001b[0m"
	install_packages
	backup_configs
	setup_symlinks
	clone_repo_wm
	clone_repo_editors
	install_alacritty
	install_sheldon
	install_r
	install_lazygit
	install_file_managers
	install_fonts
	install_debget
	install_telegram
	install_greenclip
	echo -e "\u001b[7m Done! \u001b[0m"
}

function wm {
	echo -e "\u001b[7m Setting up Windows Managers... \u001b[0m"
	clone_repo_wm
	echo -e "\u001b[7m Done! \u001b[0m"
}

function editors {
	echo -e "\u001b[7m Setting up Editors... \u001b[0m"
	clone_repo_editors
	echo -e "\u001b[7m Done! \u001b[0m"
}

function terminals {
	echo -e "\u001b[7m Setting up Terminals... \u001b[0m"
	install_alacritty
	install_sheldon
	echo -e "\u001b[7m Done! \u001b[0m"
}

function changers {
	echo -e "\u001b[7m Setting up Changers  \u001b[0m"
	install_file_managers
	install_debget
	install_telegram
	install_greenclip
	echo -e "\u001b[7m Done! \u001b[0m"
}

if [ "$1" = "--all" -o "$1" = "-a" ]; then
	all
	exit 0
fi

# Menu TUI
echo -e "\u001b[32;1m Setting up Dotfiles...\u001b[0m"

echo -e " \u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
echo -e "  \u001b[34;1m (a) ALL(1-14) \u001b[0m"
echo -e "  \u001b[34;1m (t) TERMINAL(6,7) \u001b[0m"
echo -e "  \u001b[34;1m (f) CHANGERS(10,12,13) \u001b[0m"
echo -e "  \u001b[34;1m (1) Install packages \u001b[0m"
echo -e "  \u001b[34;1m (2) Backup current config \u001b[0m"
echo -e "  \u001b[34;1m (3) Setup symlinks \u001b[0m"
echo -e "  \u001b[34;1m (4) Clone repo wm \u001b[0m"
echo -e "  \u001b[34;1m (5) Clone repo editors \u001b[0m"
echo -e "  \u001b[34;1m (6) Install alacritty \u001b[0m"
echo -e "  \u001b[34;1m (7) Install sheldon \u001b[0m"
echo -e "  \u001b[34;1m (8) Install r \u001b[0m"
echo -e "  \u001b[34;1m (9) Install lazygit \u001b[0m"
echo -e "  \u001b[34;1m (10) Install file managers \u001b[0m"
echo -e "  \u001b[34;1m (11) Install fonts \u001b[0m"
echo -e "  \u001b[34;1m (12) Install deb-get \u001b[0m"
echo -e "  \u001b[34;1m (13) Install telegram \u001b[0m"
echo -e "  \u001b[34;1m (14) Install greenclip \u001b[0m"
echo -e "  \u001b[31;1m (*) Anything else to exit \u001b[0m"

echo -en "\u001b[32;1m ==> \u001b[0m"

read -r option

case $option in

"a")
	all
	;;

"t")
	terminals
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
	wm
	;;

"5")
	editors
	;;

"6")
	install_alacritty
	;;

"7")
	install_sheldon
	;;

"8")
	install_r
	;;

"9")
	install_lazygit
	;;

"10")
	install_file_managers
	;;

"11")
	install_fonts
	;;

"12")
	install_debget
	;;

"13")
	install_telegram
	;;

"14")
	install_greenclip
	;;

*)
	echo -e "\u001b[31;1m Invalid option entered, Bye! \u001b[0m"
	exit 0
	;;
esac

exit 0
