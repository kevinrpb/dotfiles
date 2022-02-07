# zsh stuff
set -o magicequalsubst

# Use antigen to load theme and plugins
source $DOTFILES/.antigenrc

# User configuration
export LANG=en_US.UTF-8
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E\n================'

HIST_STAMPS="dd/mm/yyyy"
VSCODE=code-insiders

# Aliases
source $DOTFILES/.alias

# How ~/.zshrc should look like
# export ANTIGEN_DIR=/usr/local/share/antigen
# source $ANTIGEN_DIR/antigen.zsh

# export DOTFILES=/Users/kevs/dotfiles
# source $DOTFILES/.zshrc

# export STARSHIP_CONFIG=$DOTFILES/starship.toml
# eval "$(starship init zsh)"

# export PYTHONPATH="$HOME/Developer:$PYTHONPATH"
# eval "$(pyenv init --path)"

# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# export PATH="$HOME/.local/bin:$PATH"
