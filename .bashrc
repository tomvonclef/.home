#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# if on the machine archinvis, restart bash using ssh-agent
if [ `uname -n` == "archinvis" ] && [ ! $starting_ssh_tvc ]
then
    starting_ssh_tvc="yes"
    export starting_ssh_tvc
    exec ssh-agent /bin/bash
fi

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

