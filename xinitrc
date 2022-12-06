#!/bin/sh

/etc/X11/xinit/xinitrc

# global xinitrc file, used by all X sessions started by xinit (startx)

setxkbmap -option grp:alt_shift_toggle -layout us,ru &

#gxkb &

exec awesome

