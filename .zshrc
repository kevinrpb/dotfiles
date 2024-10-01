# zsh stuff
set -o magicequalsubst

# Use antigen to load theme and plugins
source $DOTFILES/.zinitrc

# User configuration
export LANG=en_US.UTF-8
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E\n================'
export EDITOR=micro

export HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=1000
export SAVEHIST=5000
export HISTFILE=$HOME/.zsh_history
setopt SHARE_HISTORY

# Aliases
source $DOTFILES/.alias

# OS config
if [[ $(uname) == "Darwin" ]]; then
  DOT_SYSTEM="macos"
elif command -v freebsd-version > /dev/null; then
  DOT_SYSTEM="linux"
elif command -v apt > /dev/null; then
  DOT_SYSTEM="linux"
else
  echo 'Unknown OS!'
fi

# Load configs
if [ -f "$DOTFILES/$DOT_SYSTEM.zshrc" ]; then
  source "$DOTFILES/$DOT_SYSTEM.zshrc"
fi

for item ($DOT_INCLUDES) {
  BASE=$DOTFILES/config/$item

  if [ -f "$BASE/$DOT_SYSTEM.zshrc" ]; then
    source $BASE/$DOT_SYSTEM.zshrc
  elif [ -f "$BASE/common.zshrc" ]; then
    source $BASE/common.zshrc
  fi

  unset BASE
}

# Autocompletions
if [ -f "$HOME/.zfunc" ]; then
  fpath+=$HOME/.zfunc
fi

autoload -Uz compinit && compinit

# How ~/.zshrc should look like
# export DOTFILES=$HOME/dotfiles
# DOT_INCLUDES=(
#   'nvm'
#   'pyenv'
#   'starship'
# )

# source $DOTFILES/.zshrc

# export PATH=$PATH:$HOME/.local/bin
# export PATH=$PATH:$HOME/.mint/bin
