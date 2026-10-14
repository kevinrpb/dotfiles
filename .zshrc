# zsh stuff
set -o magicequalsubst

# Use zshinit to load stuff
source $DOTFILES/.zinitrc

# User configuration
export HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=1000
export SAVEHIST=5000
export HISTFILE=$HOME/.zsh_history
setopt SHARE_HISTORY

# Aliases
source $DOTFILES/.alias

# Autocompletions
if [ -f "$HOME/.zfunc" ]; then
  fpath+=$HOME/.zfunc
fi

autoload -Uz compinit && compinit

# Use Ctrl+x Ctrl+e to edit current command in the editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
