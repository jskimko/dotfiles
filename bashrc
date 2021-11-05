#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# disable <C-s>
[[ $- == *i* ]] && stty -ixon

# Prompt
function nonzero_return() {
    RETVAL=$?
    [ $RETVAL -ne 0 ] && echo "$RETVAL "
}
function git_prompt() {
    git_branch=`git branch 2>/dev/null | grep ^* | awk '{print $2}'`
    if [ -n "$git_branch" ]; then
        echo " ($git_branch)"
    fi
}

# Environment variables
export PATH="$HOME/.local/bin:$PATH"
export PS1="\[\e[31;1m\]\$(nonzero_return)\[\e[93;1m\][\h:\w\[\$(git_prompt)\]]\\$ \[\e[m\]"
export HISTCONTROL=ignoreboth:erasedups
export LS_COLORS=$LS_COLORS':di=0;35:'
export EDITOR="vim"

# Aliases
alias v='vim'
alias ls="ls --color=auto"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gl="git log --oneline -20"
alias gb="git branch"
#alias pdflatex='pdflatex -halt-on-error'
#alias expac='expac --timefmt="%Y-%m-%d %T" "%l\t%n" | sort'
#alias mavail="module avail"
#alias mload="module load"
#alias munload="module unload"
#alias sme="squeue -u kimko1"
#alias bme="bjobs -u kimko1"

# umask
umask 0077
