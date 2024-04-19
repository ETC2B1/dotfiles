# .bashrc used by ETC2B1
# Author: ETC2B1
# I'm still a boomer and use Bash over Zsh most of the time
# The conversion is pretty easy though, so I'll just leave this
# here instead of making both versions, yall aren't that special
# >:D

# INTERNAL/VISUAL
# colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# command prompt
#PS1='[\u@\h \W]\$ '
PS1='λ \W \$ '

# ALIAS

# net
alias connect-master="ssh -p ____ giygas@___.___.__.___."
alias mount-pc="sshfs -p ____ -o allow_other giygas@___.___.__.___:/mnt/DATA /mnt/SHARE"

# package management
#alias pacclear="sudo pacman -Rsn $(pacman -Qdtq)" #DISABLED, USE MANUALLY
alias paclist="comm -23 <(pacman -Qqett | sort) <(pacman -Qdg base-devel | sort | uniq)"

# gaming
alias bms="WINEPREFIX=$HOME/Games/bms32 LANG=ja_JP.UTF-8 wine $HOME/Games/LR2beta3/LR2.exe &"
