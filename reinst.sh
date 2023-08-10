#!/bin/bash

# Fetch submodules
# git submodule update --init --recursive

RC='\e[0m'
RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'
GREEN2='[32;1m'
WHITE='[37;1m'
BLUE='[34;1m'

RV='\u001b[7m'

ALL_REPOS_DIR=$HOME/REPOS

THIS_REPO_PATH="$(dirname "$(realpath "$0")")"
# THIS_REPO_PATH=$HOME/REPOS/re_inst
DOT_CFG_PATH=$THIS_REPO_PATH/config
DOT_HOME_PATH=$THIS_REPO_PATH/home
USR_CFG_PATH=$HOME/.config
# USR_CFG_PATH=$THIS_REPO_PATH/test

SRC_DIR=$HOME/src
FONT_DIR=$HOME/.local/share/fonts

configExists() {
	[[ -e "$1" ]] && [[ ! -L "$1" ]]
}

command_exists() {
	command -v "$1" >/dev/null 2>&1
}

checkEnv() {
	## Check Package Handeler
	PACKAGEMANAGER='apt dnf'
	for pgm in ${PACKAGEMANAGER}; do
		if command_exists "${pgm}"; then
			PACKAGER=${pgm}
			echo -e "${RV}Using ${pgm}"
		fi
	done

	if [ -z "${PACKAGER}" ]; then
		echo -e "${RED}Can't find a supported package manager"
		exit 1
	fi

	## Check if the current directory is writable.
	PATHs="$THIS_REPO_PATH $USR_CFG_PATH"
	for path in $PATHs; do
		if [[ ! -w ${path} ]]; then
			echo -e "${RED}Can't write to ${path}${RC}"
			exit 1
		fi
	done
}
checkEnv

mkdir -p "$USR_CFG_PATH" "$SRC_DIR" "$FONT_DIR"

function install_packages {
	DEPENDENCIES='xauth xorg \
		build-essential libreadline-dev unzip curl wget python3 pipx \
		cmake pkg-config xclip libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev \
		libxml2-dev \
		libfontconfig1-dev libxcb-shape0-dev libxcb-xfixes0-dev libxkbcommon-dev \
		connman cmst connman-gtk connman-ui \
		pulseaudio alsa alsa-utils alsa-tools alsa-oss mplayer mirage rhythmbox moc mpv \
		aptitude nala exa zsh \
		cmus tmux picom fzf htop gh rofi \
		zathura zathura-pdf-poppler zathura-djvu zathura-ps zathura-cb libreoffice-writer libreoffice-l11n-ru \
		pandoc pandoc-citeproc \
		atool bat fd-find fasd silversearcher-ag \
		ripgrep xsel ncdu powerline autorandr libnotify-bin \
		locales language-pack-ru console-cyrillic'

	echo -e "${YELLOW}Installing required packages...${RC}"
	sudo ${PACKAGER} install -yq ${DEPENDENCIES}
}

function back_sym {
	# перед создание линков делает бекапы только тех пользовательских конфикураций,
	# файлы которых есть в ./config ./home
	echo -e "\u001b${YELLOW} Backing up existing files... ${RC}"
	for config in $(command ls "${DOT_CFG_PATH}"); do
		if configExists "${USR_CFG_PATH}/${config}"; then
			echo -e "${YELLOW}Moving old config ${USR_CFG_PATH}/${config} to ${USR_CFG_PATH}/${config}.old${RC}"
			if ! mv "${USR_CFG_PATH}/${config}" "${USR_CFG_PATH}/${config}.old"; then
				echo -e "${RED}Can't move the old config!${RC}"
				exit 1
			fi
			echo -e "${WHITE} Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old' ${RC}"
		fi
		echo -e "${GREEN}Linking ${DOT_CFG_PATH}/${config} to ${USR_CFG_PATH}/${config}${RC}"
		if ! ln -snf "${DOT_CFG_PATH}/${config}" "${USR_CFG_PATH}/${config}"; then
			echo echo -e "${RED}Can't link the config!${RC}"
			exit 1
		fi
	done

	for config in $(command ls "${DOT_HOME_PATH}"); do
		if configExists "$HOME/.${config}"; then
			echo -e "${YELLOW}Moving old config ${HOME}/.${config} to ${HOME}/.${config}.old${RC}"
			if ! mv "${HOME}/.${config}" "${HOME}/.${config}.old"; then
				echo -e "${RED}Can't move the old config!${RC}"
				exit 1
			fi
			echo -e "${WHITE} Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old' ${RC}"
		fi
		echo -e "${GREEN}Linking ${DOT_HOME_PATH}/${config} to ${HOME}/.${config}${RC}"
		if ! ln -snf "${DOT_HOME_PATH}/${config}" "${HOME}/.${config}"; then
			echo echo -e "${RED}Can't link the config!${RC}"
			exit 1
		fi
	done
}

git_http_addres="https://github.com"
# git_ssh_addres="git@github.com"
git_user="RU927"
my_re_repo=("lang_env_packagemanager" "shell" "tile" "writer" "run" "net")

function clone_my_re_repo {
	for r in "${my_re_repo[@]}"; do
		echo -e "${RV} Cloning repo re_$r...${RC}"
		mkdir -p "$ALL_REPOS_DIR/re_$r"
		git clone "$git_http_addres/$git_user/re_$r" "$ALL_REPOS_DIR/re_$r"
		cd "$ALL_REPOS_DIR/re_$r" || exit
		bash "$ALL_REPOS_DIR/re_$r/re$r.sh"
	done
}

# if ! command -v gh >/dev/null 2>&1; then
#     echo "Install gh first"
#     exit 1
# fi
#
# if ! gh auth status >/dev/null 2>&1; then
#     echo "You need to login: gh auth login"
#     exit 1
# fi
# git remote add origin "$git_ssh_addres:$git_user/re_$r"

# function xyz {
#  print hello
# }
#
# function xyz {
#  print hello
# }
#
# function xyz {
#  print hello
# }
#
# function xyz {
#  print hello
# }

function install_file_managers {
	echo -e "${RV} Installing file managers ${RC}"
	sudo apt install libjpeg-dev zlib1g-dev python3-dev libxtst-dev nautilus
	pip3 install ./set/ueberzug_18.1.9.orig.tar.gz
	mkdir -p ~/.local/bin
	# ln -s "$PWD/config/vifm/scripts/vifmrun" ~/.local/bin
	# ln -s "$PWD/config/vifm/scripts/vifmimg" ~/.local/bin
	# pip3 install ranger-fm
	# pipx run --spec ranger-fm ranger
}

function install_fonts {
	echo -e "${RV} Installing fonts ${RC}"
	mkdir -p "${SRC_DIR}"/fonts
	# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/RobotoMono.zip -P "${SRC_DIR}"/fonts
	# unzip JetBrainsMono.zip -d ~/.local/share/fonts/
	unzip "${SRC_DIR}"/fonts/RobotoMono.zip -d "${FONT_DIR}"
	sudo fc-cache -fr
}

function install_telegram {
	echo -e "${RV} Installing telegram ${RC}"
	mkdir -p "${SRC_DIR}"/tetegram
	#Telegramm
	wget https://telegram.org/dl/desktop/linux -P "${SRC_DIR}"/tetegram
	sudo tar -xpf "${SRC_DIR}"/tetegram/linux -C /opt
	sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop
	sudo chmod -R 775 /opt/Telegram
}

function all {
	echo -e "${RV} Setting up Dotfiles... ${RC}"
	install_packages
	back_sym
	# clone_repo_wm
	# clone_repo_editors
	# clone_repo_shells
	# clone_repo_starter
	clone_my_re_repo
	install_file_managers
	install_fonts
	install_debget
	install_telegram
	echo -e "${RV} Done! ${RC}"
}

# function repos {
# 	echo -e "${RV} Setting up Editors... ${RC}"
# 	clone_repo_editors
# 	clone_repo_wm
# 	clone_repo_shells
# 	clone_repo_starter
# 	echo -e "${RV} Done! ${RC}"
# }

if [ "$1" = "--all" -o "$1" = "-a" ]; then
	all
	exit 0
fi

# Menu TUI
echo -e "\u001b${GREEN} Setting up Dotfiles...${RC}"

echo -e " \u001b${WHITE}\u001b[4mSelect an option:${RC}"
echo -e "  \u001b${BLUE} (a) ALL(1-12) ${RC}"
# echo -e "  \u001b${BLUE} (r) Clone all repos (3,4,5,6) ${RC}"
echo -e "  \u001b${BLUE} (1) Install packages ${RC}"
echo -e "  \u001b${BLUE} (2) Backup config and setup symlinks ${RC}"
# echo -e "  \u001b${BLUE} (3) Clone repo wm ${RC}"
# echo -e "  \u001b${BLUE} (4) Clone repo editors ${RC}"
# echo -e "  \u001b${BLUE} (5) Clone repo shells ${RC}"
# echo -e "  \u001b${BLUE} (6) Clone repo starter ${RC}"
echo -e "  \u001b${BLUE} (7) Clone all re_repo ${RC}"
echo -e "  \u001b${BLUE} (8) Install file managers ${RC}"
echo -e "  \u001b${BLUE} (9) Install fonts ${RC}"
echo -e "  \u001b${BLUE} (10) Install deb-get ${RC}"
echo -e "  \u001b${BLUE} (11) Install telegram ${RC}"
echo -e "  \u001b${RED} (*) Anything else to exit ${RC}"

echo -en "\u001b${GREEN2} ==> ${RC}"

read -r option

case $option in

"a")
	all
	;;

# "r")
# 	repos
# 	;;

"1")
	install_packages
	;;

"2")
	back_sym
	;;

# "3")
# 	clone_repo_wm
# 	;;
#
# "4")
# 	clone_repo_editors
# 	;;
#
# "5")
# 	clone_repo_shells
# 	;;
#
# "6")
# 	clone_repo_starter
# 	;;
"7")
	clone_my_re_repo
	;;

"8")
	install_file_managers
	;;

"9")
	install_fonts
	;;

"10")
	install_debget
	;;

"11")
	install_telegram
	;;

*)
	echo -e "\u001b[31;1m Invalid option entered, Bye! ${RC}"
	exit 0
	;;
esac

exit 0
