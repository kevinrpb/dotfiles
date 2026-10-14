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

# Make it so Cmd+K (default clear in macOS) can be bound to clear the screen
# and re-print the prompt.
# iTerm2 needs to re-bind Cmd+K to send Ctrl+L (\x0c)
clear-screen-and-reprint() {
  if [[ -z "$ZELLIJ" ]]; then
    # Plain terminal: home cursor, clear screen, and erase scrollback in one
    print -n '\e[H\e[2J\e[3J'
  fi

  # In zellij the Ctrl+L keybind already runs Clear; reprint only
  zle reset-prompt
}
zle -N clear-screen clear-screen-and-reprint
