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

all_repos_dir=$HOME/REPOS

this_dir="$(dirname "$(realpath "$0")")"
dot_config=$this_dir/config
dot_home=$this_dir/home
config_dir=$HOME/.config

src_dir=$HOME/src
font_dir=$HOME/.local/share/fonts

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
	PATHs="$this_dir $config_dir"
	for path in $PATHs; do
		if [[ ! -w ${path} ]]; then
			echo -e "${RED}Can't write to ${path}${RC}"
			exit 1
		fi
	done
}
checkEnv

mkdir -p "$config_dir" "$src_dir" "$font_dir"

function install_packages {
	DEPENDENCIES="xauth xorg \
		build-essential libreadline-dev unzip curl wget python3 pipx \
		cmake pkg-config xclip libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev \
		libxml2-dev \
		libfontconfig1-dev libxcb-shape0-dev libxcb-xfixes0-dev libxkbcommon-dev \
		pulseaudio alsa alsa-utils alsa-tools alsa-oss mplayer mirage rhythmbox moc mpv \
		aptitude nala exa zsh \
		cmus tmux picom fzf htop gh rofi \
		zathura zathura-pdf-poppler zathura-djvu zathura-ps zathura-cb libreoffice-writer libreoffice-l10n-ru \
		pandoc pandoc-citeproc \
		atool bat fd-find fasd silversearcher-ag \
		ripgrep xsel ncdu powerline autorandr libnotify-bin \
		locales language-pack-ru console-cyrillic"

	echo -e "${YELLOW}Installing required packages...${RC}"
	sudo "${PACKAGER}" install ${DEPENDENCIES}
}

function back_sym {
	# перед создание линков делает бекапы только тех пользовательских конфикураций,
	# файлы которых есть в ./config ./home
	echo -e "\u001b${YELLOW} Backing up existing files... ${RC}"
	for config in $(command ls "${dot_config}"); do
		if configExists "${config_dir}/${config}"; then
			echo -e "${YELLOW}Moving old config ${config_dir}/${config} to ${config_dir}/${config}.old${RC}"
			if ! mv "${config_dir}/${config}" "${config_dir}/${config}.old"; then
				echo -e "${RED}Can't move the old config!${RC}"
				exit 1
			fi
			echo -e "${WHITE} Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old' ${RC}"
		fi
		echo -e "${GREEN}Linking ${dot_config}/${config} to ${config_dir}/${config}${RC}"
		if ! ln -snf "${dot_config}/${config}" "${config_dir}/${config}"; then
			echo echo -e "${RED}Can't link the config!${RC}"
			exit 1
		fi
	done

	for config in $(command ls "${dot_home}"); do
		if configExists "$HOME/.${config}"; then
			echo -e "${YELLOW}Moving old config ${HOME}/.${config} to ${HOME}/.${config}.old${RC}"
			if ! mv "${HOME}/.${config}" "${HOME}/.${config}.old"; then
				echo -e "${RED}Can't move the old config!${RC}"
				exit 1
			fi
			echo -e "${WHITE} Remove backups with 'rm -ir ~/.*.old && rm -ir ~/.config/*.old' ${RC}"
		fi
		echo -e "${GREEN}Linking ${dot_home}/${config} to ${HOME}/.${config}${RC}"
		if ! ln -snf "${dot_home}/${config}" "${HOME}/.${config}"; then
			echo echo -e "${RED}Can't link the config!${RC}"
			exit 1
		fi
	done
}

git_user="chikh-chikh"
git_https_addres="https://github.com"
git=$git_https_addres/$git_user
# git_ssh_addres="git@github.com"
# git=$git_ssh_addres:$git_user

my_re_repo=("paenlare" "shell" "tile" "viser" "run" "net")
my_md_repo=("watcher")
my_ex_repo=("change")

function clone_re_repo {
	for r in "${my_re_repo[@]}"; do
		echo -e "${RV} cloning re_$r...${RC}"
		mkdir -p "$all_repos_dir/re_$r"
		git clone "$git/re_$r" "$all_repos_dir/re_$r"
		# cd "$all_repos_dir/re_$r" || exit
		# bash "$all_repos_dir/re_$r/re$r.sh"
	done
}

function clone_md_repo {
	for r in "${my_md_repo[@]}"; do
		echo -e "${RV} cloning md_$r...${RC}"
		mkdir -p "$all_repos_dir/md_$r"
		git clone "$git/md_$r" "$all_repos_dir/md_$r"
		# cd "$all_repos_dir/md_$r" || exit
		# bash "$all_repos_dir/md_$r/md$r.sh"
	done
}

function clone_ex_repo {
	for r in "${my_ex_repo[@]}"; do
		echo -e "${RV} cloning ex_$r...${RC}"
		mkdir -p "$all_repos_dir/ex_$r"
		git clone "$git/ex_$r" "$all_repos_dir/ex_$r"
		# cd "$all_repos_dir/ex_$r" || exit
		# bash "$all_repos_dir/ex_$r/ex$r.sh"
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
	mkdir -p "${src_dir}"/fonts
	# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/RobotoMono.zip -P "${src_dir}"/fonts
	# unzip JetBrainsMono.zip -d ~/.local/share/fonts/
	unzip "${src_dir}"/fonts/RobotoMono.zip -d "${font_dir}"
	sudo fc-cache -fr
}

function install_telegram {
	echo -e "${RV} Installing telegram ${RC}"
	mkdir -p "${src_dir}"/tetegram
	#Telegramm
	wget https://telegram.org/dl/desktop/linux -P "${src_dir}"/tetegram
	sudo tar -xpf "${src_dir}"/tetegram/linux -C /opt
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
	clone_re_repo
	clone_md_repo
	clone_ex_repo
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

if [ "$1" = "--all" ] || [ "$1" = "-a" ]; then
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
