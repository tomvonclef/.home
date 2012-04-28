#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
#PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
#PROMPT_COMMAND='PS1="\[\033[0;33m\][\!]'\
#'[\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`'\
#'\u@\h: \[\033[34;1m\]'\
#'\`if [[ `pwd|wc -c|tr -d " "` > 35 ]]; then echo "\\W"; else echo "\\w"; fi\`'\
#'\[\e[0;33m\]]\$\[\033[0m\] "'

PROMPT_COMMAND='PS1="\[\033[0;33m\]\!:'\
'\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`'\
'\u@\h\[\033[0;33m\]:\[\033[34;1m\]\\w\[\e[0;33m\]\$\[\033[0m\] "'

# if on the machine archinvis, restart bash using ssh-agent
if [ `uname -n` == "archinvis" ]; then
    if [ ! $starting_ssh_tvc ]; then
        starting_ssh_tvc="yes"
        export starting_ssh_tvc
        exec ssh-agent /bin/bash
    else
        echo "running 'ssh-add' is helpful to git"
    fi
fi

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

if [ $(hostname | cut -c 1-5) == "hydra" ]; then
    export PYTHONPATH=~/lib/python:~/bin/setuptools:$PYTHONPATH
    export PATH=~/bin/setuptools:$PATH
fi

export PATH=~/bin:$PATH

umask 077

if [[ $TERM = "xterm" ]]; then
    screen
fi

# add color to man
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;32m") \
        LESS_TERMCAP_md=$(printf "\e[1;32m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;36m") \
            man "$@"
}
