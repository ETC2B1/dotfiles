#!/bin/bash
# .xinitrc used by ETC2B1
# Author: ETC2B1
# https://github.com/ETC2B1/dotfiles
# My custom options, explained in comments

# My startup script for recompiling in a StumpWM style
# Makes sure XMonad is always running and restarts it
# When it isn't, run "pkill xmonad" to restart without
# killing Xorg, run "pkill Xorg" for killing Xorg
WM=/home/user/bin/startxmonad

# Sets language (I use russian sometimes)
LANG=en_US.UTF-8
export LANG

# Sets the caps-lock key to ctrl
/usr/bin/setxkbmap -option "ctrl:nocaps"

# Loads .Xresources (This is the only one i've found that works
# cross-platform
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Sets background to a color
hsetroot -solid "#0000cc"

# Sets screensaver (xsecurelock using xss-lock using a
# dim-screen script w/ xscreensaver) & launch variables
# ...superflous but I like it, not simple but very customizable
env XSECURELOCK_SAVER=saver_xscreensaver

xss-lock -n dim-screen.sh -- env XSECURELOCK_AUTH_FOREGROUND_COLOR="#cccccc" XSECURELOCK_BACKGROUND_COLOR="#000000" XSECURELOCK_PASSWORD_PROMPT="time_hex" XSECURELOCK_SHOW_DATETIME="true" XSECURELOCK_SHOW_HOSTNAME="true" XSECURELOCK_FONT="Flexi IBM VGA False:style=Regular:size=12:hinting=true:antialias=true" XSECURELOCK_SHOW_USERNAME="true" XSECURELOCK_SAVER=saver_xscreensaver xsecurelock &

xset s on
xset s 128 120

# Sets resolution
xrandr -s 1024x768

# executes the WM script
$WM
