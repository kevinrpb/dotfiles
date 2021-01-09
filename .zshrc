# zsh stuff
set -o magicequalsubst

# Use antigen to load theme and plugins
source $DOTFILES/.antigenrc

# User configuration
export LANG=en_US.UTF-8
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E\n================'

HIST_STAMPS="dd/mm/yyyy"
VSCODE=code-insiders

# Theme & prompt configuration
source $DOTFILES/.prompt

# Aliases
source $DOTFILES/.alias
