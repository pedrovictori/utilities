# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#improving prompt
export PROMPT_COMMAND="echo -n \[\$(date +%H:%M:%S)\]\ "
export PS1="\u@\h:\w\\$ "

#https://github.com/stephenturner/oneliners
#aliases for cd ..
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

#ls aliases
alias ls="ls -1p --color=auto"
alias l="ls -lhGgo"
alias ll="ls -lh"
alias la="ls -lhGgoA"
alias lt="ls -lhGgotr"
alias lS="ls -lhGgoSr"
alias l.="ls -lhGgod .*"
alias lhead="ls -lhGgo | head"
alias ltail="ls -lhGgo | tail"
alias lmore='ls -lhGgo | more'

#generalized extract function
# as suggested by Mendel Cooper in "Advanced Bash Scripting Guide"
extract () {
   if [ -f $1 ] ; then
       case $1 in
        *.tar.bz2)      tar xvjf $1 ;;
        *.tar.gz)       tar xvzf $1 ;;
        *.tar.xz)       tar Jxvf $1 ;;
        *.bz2)          bunzip2 $1 ;;
        *.rar)          unrar x $1 ;;
        *.gz)           gunzip $1 ;;
        *.tar)          tar xvf $1 ;;
        *.tbz2)         tar xvjf $1 ;;
        *.tgz)          tar xvzf $1 ;;
        *.zip)          unzip $1 ;;
        *.Z)            uncompress $1 ;;
        *.7z)           7z x $1 ;;
        *)              echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

#to create a directory and cd to it simultaneously
function mcd { mkdir -p "$1" && cd "$1";}

#Refresh your .bashrc
alias refresh="source ~/.bashrc"

#Edit your .bashrc
alias eb="nano ~/.bashrc"

#Browse 'up' and 'down'
alias u='clear; cd ../; pwd; ls -lhGgo'
alias d='clear; cd -; ls -lhGgo'

#systemctl aliases
alias sysenable="sudo systemctl enable --now"
alias sysrestart="sudo systemctl restart"
alias sysstatus="sudo systemctl status"

#pacman aliases
alias install="sudo pacman -S"
alias upgrade="sudo pacman -Syu"
alias uninstall="sudo pacman -R"
