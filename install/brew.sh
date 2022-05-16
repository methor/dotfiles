#!/usr/bin/env bash

if test ! "$( which zsh )"; then
    echo -e "\\n\\nInstalling oh-my-zsh"
    echo "=============================="
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if test ! "$( which brew )"; then
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo $(eval "(/opt/homebrew/bin/brew shellenv)") >> /Users/maosen/.zprofile
    eval $(/opt/homebrew/bin/brew shellenv)
fi
# supress zshrc error
/opt/homebrew/bin/brew install zplug


# brew install git
# cd "$(brew --repo)"
# git remote set-url origin https://mirrors.ustc.edu.cn/brew.git
# cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
# git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
# brew update


echo -e "\\n\\nInstalling homebrew packages..."
echo "=============================="

formulas=(
#    ack
	fd # 快速模糊搜索，用来搜索目录
	Go
	Go
    diff-so-fancy # diff美化
	clipper
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
    z
	fasd # 快速跳转，不确定能不能用
    zsh
    ripgrep # 快速模糊搜索，用在文件
    git-standup # 团队git提交情况
    entr
    zplug # zsh插件管理框架
	cheat
	npm
	qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook qlvideo provisionql quicklookapk
	cloc
	cmake
	global
	ninja
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
    intellij-idea
    postman
    sequel-pro
    macdown
    evernote
    dosbox
    middleclick
    alfred
    pycharm
    goland
    sublime-text
    jenv
	webpquicklook
	suspicious-package
	quicklookase
	qlvideo
	provisionql
	quicklook-pat
	quicklookapk
	hex-fiend
	julia
)

for formula in "${cask_formulas[@]}"; do
    formula_name=$( echo "$formula" | awk '{print $1}' )
    if brew list cask "$formula_name" > /dev/null 2>&1; then
        echo "$formula_name already installed... skipping."
    else
        brew install cask "$formula"
    fi
done

# brew services, managing backgroud services
brew tap homebrew/services


# check for custom bin directory and add to path
if [[ -d ~/bin ]]; then
    export PATH=~/bin:$PATH
fi

# this script is being sourced
if [[ $0 != $BASH_SOURCE ]]; then
    pwd="$pwd/$( dirname "${BASH_SOURCE[0]}" )"
# otherwise being executed
else
    pwd="$(cd $(dirname $0); pwd)"
fi
bash "$pwd"/nvim.sh
bash "$pwd"/fzf.sh
bash "$pwd"/osx.sh
