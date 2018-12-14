#!/usr/bin/env bash

bash install/brew.sh
pwd=$(dirname "$BASH_SOURCE")
ln -s "$pwd"/conf/.gitconfig ~/.gitconfig
ln -s "$pwd"/conf/.tmux.conf ~/.tmux.conf
ln -s "$pwd"/conf/.zshrc ~/.zshrc

mkdir -p ~/.config/nvim/
ln -s "$pwd"/conf/init.vim ~/.config/nvim/init.vim
ln -s "$pwd"/conf/hub ~/.config/hub

# make karabiner-elements symlinks and reload
ln -s "$pwd"/conf/karabiner ~/.config
launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server

mkdir -p ~/.config/iterm2
ln -s "$pwd"/conf/com.googlecode.iterm2.plist ~/.config/iterm2/com.googlecode.iterm2.plist

mkdir -p ~/bin
ln -s "$pwd"/bin/tm ~/bin/tm

