# Status Bar
#dwmblocks &

# Random Photo Every Login
#feh --bg-fill --randomize ~/Pictures/wallpapers/* &

# Monitor Config
#xrandr --auto --output DVI-D-0 --mode 2560x1440 --right-of HDMI-0

# Network Manager Applet
#nm-applet --indicator &

# Environment variables set everywhere
export EDITOR="nvim"
export VISUAL="nvim"
export READER="zathura"
export TERMINAL="alacrytty"
export PAGER="less"
export WM="awesome"
#export BROWSER="brave"

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# zsh config dir
#export ZDOTDIR=$HOME/.config/zsh



# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#. "$HOME/.cargo/env"

