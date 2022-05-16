#!/usr/bin/env bash

bash install/brew.sh

pwd=$(cd $(dirname $0); pwd)
ln -Fs "$pwd"/conf/.gitconfig ~/.gitconfig
ln -Fs "$pwd"/conf/.tmux.conf ~/.tmux.conf
ln -Fs "$pwd"/conf/.zshrc ~/.zshrc

mkdir -p ~/.config/nvim/
ln -Fs "$pwd"/conf/init.vim ~/.config/nvim/init.vim
ln -Fs "$pwd"/conf/hub ~/.config/hub

# copy and paste karabiner-elements configs and reload
cp -R "$pwd"/conf/karabiner ~/.config
launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server

mkdir -p ~/.config/iterm2
ln -Fs "$pwd"/conf/iterm2/com.googlecode.iterm2.plist ~/.config/iterm2/com.googlecode.iterm2.plist

mkdir -p ~/bin
ln -Fs "$pwd"/bin/tm ~/bin/tm

