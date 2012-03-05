#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '


if [ `uname -n` == "archinvis" ]; then
    ssh-add;
fi

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
