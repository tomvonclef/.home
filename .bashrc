#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Format the command-prompt
PROMPT_COMMAND='PS1="\[\033[0;33m\]\!:'\
'\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`'\
'\u@\h\[\033[0;33m\]:\[\033[34;1m\]\\w\[\e[0;33m\]\$\[\033[0m\] "'

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# restart bash using ssh-agent
if [ ! $starting_ssh_tvc ]; then
  starting_ssh_tvc="yes"
  export starting_ssh_tvc
  exec ssh-agent /bin/bash
fi

# bash aliases are in a separate file
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# ~/bin to path
export PATH=~/bin:$PATH

# new file permissions default
umask 077

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

# start tmux, if it exists and is not running
if command -v tmux>/dev/null && [[ ! $TERM =~ screen ]] && [ -z $TMUX ]; then

  # tmux before v2.1 requires different settings for the mouse
  if [[ $(echo "$(tmux -V | cut -d' ' -f2) < 2.1" | bc -l) -eq 1 ]]; then
    tmux -f .tmux_before2.1.conf;
  else
    tmux;
  fi
fi

