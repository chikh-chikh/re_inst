#!/bin/sh

/etc/X11/xinit/xinitrc

setxkbmap -option grp:alt_shift_toggle -layout us,ru &

gxkb &

# systemctl --user import-environment DISPLAY &

# greenclip daemon &

exec awesome

