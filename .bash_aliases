# Macs do not accept the flag --color=auto
if [[ $OSTYPE != darwin* ]]; then
    alias ls="ls --color=auto"
    alias lll="ls -lA --color=always | less -r"
    alias rm="rm -I"
else
    alias ls="ls -G"
    alias lll="ls -lA | less -r"
    alias rm="rm -i"
fi

alias ll="ls -l"
alias la="ls -A"
alias lal="ls -Al"
alias lsd="ll | grep ^d"

alias gs="git status"
alias ga="git add"
alias gc="git commit -m "
alias gp="git push"
alias gd="git diff --color=auto"

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias g='grep --color=always'

alias l='less -R'

alias pingg='ping -c 1 google.com'

alias t="todo.sh"
