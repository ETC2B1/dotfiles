#
# ~/.bashrc
#

# INTERNAL/VISUAL
# colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# command prompt
#PS1='[\u@\h \W]\$ '
PS1='λ \W \$ '

# ALIAS

# net
alias connect-master="ssh -p 1337 giygas@192.168.68.100"
alias mount-pc="sshfs -p 1337 -o allow_other giygas@192.168.68.100:/mnt/DATA /mnt/SHARE"

# package management
#alias pacclear="sudo pacman -Rsn $(pacman -Qdtq)" #DISABLED, USE MANUALLY
alias paclist="comm -23 <(pacman -Qqett | sort) <(pacman -Qdg base-devel | sort | uniq)"

#gaming
alias bms="WINEPREFIX=$HOME/Games/bms32 LANG=ja_JP.UTF-8 wine $HOME/Games/LR2beta3/LR2.exe &"
