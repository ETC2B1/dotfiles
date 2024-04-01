#!/bin/bash

WM=/home/user/bin/startdwm
LANG=en_US.UTF-8

export LANG

/usr/bin/setxkbmap -option "ctrl:nocaps"

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

hsetroot -solid "#000000"

env XSECURELOCK_SAVER=saver_xscreensaver

xss-lock -n dim-screen.sh -- env XSECURELOCK_AUTH_FOREGROUND_COLOR="#cccccc" XSECURELOCK_BACKGROUND_COLOR="#000000" XSECURELOCK_PASSWORD_PROMPT="time_hex" XSECURELOCK_SHOW_DATETIME="true" XSECURELOCK_SHOW_HOSTNAME="true" XSECURELOCK_FONT="Flexi IBM VGA False:style=Regular:size=12:hinting=true:antialias=true" XSECURELOCK_SHOW_USERNAME="true" XSECURELOCK_SAVER=saver_xscreensaver xsecurelock &

xset s on
xset s 128 120

xrandr -s 1024x768

/home/user/bin/statusdwm &

$WM
