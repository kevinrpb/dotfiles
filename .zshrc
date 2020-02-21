# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
set -o magicequalsubst

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="spaceship"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="dd/mm/yyyy"
VSCODE=code-insiders

plugins=(
  wd
  dircycle
  cp
  git
  sudo
  vscode
  osx
)

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E\n================'

# Theme configuration

#
# Prompt Order
#
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  # host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  # node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  # docker        # Docker section
  # aws           # Amazon Web Services section
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  # pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  # kubecontext   # Kubectl context section
  # terraform     # Terraform workspace section
  # exec_time     # Execution time
  # line_sep      # Line break
  # battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

#
# Prompt Options -> https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md
#

# Adds a newline character before each prompt line
SPACESHIP_PROMPT_ADD_NEWLINE="false"
# Make the prompt span across two lines
SPACESHIP_PROMPT_SEPARATE_LINE="false"
# Prompt character to be shown before any command
SPACESHIP_CHAR_SYMBOL="\$ " # ➜
# Color of prompt character if last command completes successfully
SPACESHIP_CHAR_COLOR_SUCCESS="magenta"
# Color of prompt character if last command returns non-zero exit-code
SPACESHIP_CHAR_COLOR_FAILURE="red"
# Color of secondary prompt character
SPACESHIP_CHAR_COLOR_SECONDARY="yellow"
# Prefix before time section
SPACESHIP_TIME_PREFIX=" at"
# Suffix after time section
SPACESHIP_TIME_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
# Color of time section
SPACESHIP_TIME_COLOR="yellow"
# Color of user section
SPACESHIP_USER_COLOR="yellow"
# Color of user section when it's root
SPACESHIP_USER_COLOR_ROOT="red"
# Color of host section
SPACESHIP_HOST_COLOR="blue"
# Color of host in SSH connection
SPACESHIP_HOST_COLOR_SSH="green"
# Number of folders of cwd to show in prompt, 0 to show all
SPACESHIP_DIR_TRUNC="3"
# While in git repo, show only root directory and folders inside it
SPACESHIP_DIR_TRUNC_REPO="true"
# Color of directory section
SPACESHIP_DIR_COLOR="cyan"
# Color of Git branch subsection
SPACESHIP_GIT_BRANCH_COLOR="green"
# Prefix before Git status subsection
SPACESHIP_GIT_STATUS_PREFIX=" ("
# Suffix after Git status subsection
SPACESHIP_GIT_STATUS_SUFFIX=")"
# Color of Git status subsection
SPACESHIP_GIT_STATUS_COLOR="blue"

# Aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias c="clear"
alias ls="ls -GFh"
alias lsl="ls -la"
alias code="code-insiders"
alias c="clear"
