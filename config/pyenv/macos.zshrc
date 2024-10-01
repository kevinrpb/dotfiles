export PYENV="$HOME/.pyenv"
export PYENV_ROOT="$HOME/.pyenv"
export PYENV_HOME="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PIPX_DEFAULT_PYTHON="$HOME/.pyenv/shims/python"
