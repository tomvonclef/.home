#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

if [ `uname -n` == "archinvis" ] && [ ! -e .starting_ssh_tvc ]
then
    touch .starting_ssh_tvc
    exec ssh-agent /bin/bash
fi

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

