#!/usr/bin/env bash

echo -e "\\nInstalling pyenv..."
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install 2.7.11
pyenv install 3.6.4

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
