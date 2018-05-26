#!/usr/bin/env bash

echo -e "\\n\\Installing pyenv..."
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install 2.7.11
pyenv install 3.6.4

pyenv virtualenv 2.7.11 neovim2
pyenv virtualenv 3.6.4 neovim3

pyenv activate neovim2
pip install neovim
pyenv rehash

pyenv activate neovim3
pip install neovim
# The following is optional, and the neovim3 env is still active
# This allows flake8 to be available to linter plugins regardless
# of what env is currently active.  Repeat this pattern for other
# packages that provide cli programs that are used in Neovim.
pip install flake8
pip install autopep8
ln -s `pyenv which flake8` ~/bin/flake8  # Assumes that $HOME/bin is in $PATH
ln -s `pyenv which autopep8` ~/bin/autopep8
pyenv rehash
pyenv deactivate
pyenv global 3.6.4

