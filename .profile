#!/bin/bash
# Profile file. Runs on login.

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')"
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="chromium"
export READER="zathura"
export FILE="nnn"
export BIB="$HOME/Documents/LaTeX/uni.bib"
export REFER="$HOME/.referbib"
export SUDO_ASKPASS="$HOME/.scripts/tools/dmenupass"
export PIX="$HOME/.pix/"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

[ ! -f ~/.shortcuts ] && shortcuts >/dev/null 2>&1

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# Switch escape and caps if tty:
sudo -n loadkeys ~/.scripts/ttymaps.kmap 2>/dev/null


# Set up Ibus when log in
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -x -d

# NNN Setting
## Copier
export NNN_COPIER="$HOME/.config/nnn/copier.sh"
## Use EDITOR for text
export NNN_USE_EDITOR=1
## Make bookmark
export NNN_BMS='h:~;d:~/Documents;D:~/Downloads;p:~/Pictures'
## Disable auto-selection in navigate-as-you-type mode
export NNN_NO_AUTOSELECT=1
## Disable open files in 'l' or rightarrow.
export NNN_RESTRICT_NAV_OPEN=1


export GOPATH=$HOME/gopath
export PATH=$GOPATH:$GOPATH/bin:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

