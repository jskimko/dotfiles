#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $- == *i* ]] && stty -ixon

# Sources
. $HOME/.git-completion.bash

# Prompt
function branch {
    git branch 2>/dev/null | grep "^*" | sed 's/\* \(.*\)/ (\1)/'
}
function branch_color {
    clean=`git status 2>/dev/null | grep "working tree clean"`
    if [[ -z $clean ]]; then
        echo -ne "\e[31m"
    elif [[ -n $clean ]]; then
        echo -ne "\e[36m"
    fi
}

PS1="\[\e[1m\]\[\e[37m\][\[\e[32m\]\w\[\$(branch_color)\]\$(branch)\[\e[37m\]]$ \[\e[0m\]"

# Environment variables
PATH=$HOME/bin:$PATH
HISTTIMEFORMAT="%m/%d/%y %T | "

# Aliases
alias pdflatex='pdflatex -halt-on-error'
alias expac='expac --timefmt="%Y-%m-%d %T" "%l\t%n" | sort'
alias gs='git status -s'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gl='git log'
alias v='vim'

# Other
umask 077
