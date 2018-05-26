#!/usr/bin/env bash

source brew.sh
ln -s conf/.gitconfig ~/.gitconfig
ln -s conf/.tmux.conf ~/.tmux.conf
ln -s conf/.zshrc ~/.zshrc

mkdir -p ~/.config/nvim/
ln -s conf/init.vim ~/.config/nvim/init.vim
ln -s conf/hub ~/.config/hub

# make karabiner-elements symlinks and reload
ln -s conf/karabiner ~/.config
launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server

mkdir -p ~/.config/iterm2
ln -s conf/com.googlecode.iterm2.plist ~/.config/iterm2/com.googlecode.iterm2.plist

ln -s bin/tm ~/bin/tm

