# zsh stuff
set -o magicequalsubst

# Load plugins/tools
source $HOME/.config/zsh/.zinitrc

# User configuration
export LANG=en_US.UTF-8
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E\n================'
export EDITOR=nano

export HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=1000
export SAVEHIST=5000
export HISTFILE=$HOME/.zsh_history
setopt SHARE_HISTORY

# Aliases
source $HOME/.config/zsh/.alias

# Prompt
eval "$(starship init zsh)"

# Autocompletions
if [ -f "$HOME/.zfunc" ]; then
  fpath+=$HOME/.zfunc
fi

autoload -Uz compinit && compinit

# Use Ctrl+x Ctrl+e to edit current command in the editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
