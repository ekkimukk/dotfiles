#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias l='ls -AlFh'
alias grep='grep --color=auto'
alias v='nvim'
alias ..='cd ..'
alias ...='cd ../..'

export EDITOR='vim'

# PS1='[\u@\h \W]\$ '
PS1='\[\033[0m\] \[\033[0;36m\]\W\[\033[0m\] '
