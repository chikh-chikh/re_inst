#!/bin/sh

/etc/X11/xinit/xinitrc

# global xinitrc file, used by all X sessions started by xinit (startx)

xxkb &

setxkbmap -layout us,ru -variant -option
	grp:alt_shift_toggle,terminate:ctrl_alt_bksp &

exec awesome
