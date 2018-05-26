#!/usr/bin/env bash

if test ! "$( which brew )"; then
    echo "Installing homebrew"
    ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
fi

brew install git

cd "$(brew --repo)"
git remote set-url origin https://mirrors.ustc.edu.cn/brew.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
brew update


echo -e "\\n\\nInstalling homebrew packages..."
echo "=============================="

formulas=(
#    ack
	fd # 快速模糊搜索，用来搜索目录

	Go

    diff-so-fancy # diff美化
    direnv
    dnsmasq
    fzf # 模糊搜索框架
    git
    #'grep --with-default-names'
    highlight
    hub # github集成
    markdown
#    mas # 命令行apple store
#    neovim/neovim/neovim
	vim
	neovim
#    node
#    nginx
    python
#    rbenv
    reattach-to-user-namespace # tmux能用剪切板等
#    the_silver_searcher
    shellcheck
    tmux
    tree
    wget
	curl
    #z
	fasd # 快速跳转，不确定能不能用
    zsh
    ripgrep # 快速模糊搜索，用在文件
    git-standup # 团队git提交情况
    entr
    zplug # zsh插件管理框架
	cheat
)

for formula in "${formulas[@]}"; do
    formula_name=$( echo "$formula" | awk '{print $1}' )
    if brew list "$formula_name" > /dev/null 2>&1; then
        echo "$formula_name already installed... skipping."
    else
        brew install "$formula"
    fi
done

# brew cask applications

cask_formulas=(
	iterm2
	shadowsocksx-ng
	google-chrome
	karabiner-elements
	the-unarchiver
	android-file-transfer
	java
	visual-studio-code
	docker
	wewechat
	qq
	onedrive
	dash
)

for formula in "${cask_formulas[@]}"; do
    formula_name=$( echo "$formula" | awk '{print $1}' )
    if brew cask list "$formula_name" > /dev/null 2>&1; then
        echo "$formula_name already installed... skipping."
    else
        brew cask install "$formula"
    fi
done





echo -e "\\n\\nInstalling oh-my-zsh"
echo "=============================="
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# check for custom bin directory and add to path
if [[ -d ~/bin ]]; then
    export PATH=~/bin:$PATH
fi


source pyenv.sh
source nvim.sh
source fzf.sh
source osx.sh
