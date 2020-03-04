# zsh stuff
set -o magicequalsubst

# Use antigen to load theme and plugins
source $HOME/dotfiles/.antigenrc

# Path to oh-my-zsh installation.
# export ZSH=~/.oh-my-zsh

# User configuration
export LANG=en_US.UTF-8
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E\n================'

HIST_STAMPS="dd/mm/yyyy"
VSCODE=code-insiders

# Theme & prompt configuration
source $HOME/dotfiles/.prompt

# Aliases
source $HOME/dotfiles/.alias
