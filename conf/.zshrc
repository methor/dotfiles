# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/`whoami`/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  colored-man-pages
  extract
  z
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export GIT_EDITOR='nvim'

if [[ -d ~/bin ]]; then
    export PATH=~/bin:$PATH
fi
if [[ -d /usr/local/sbin ]]; then
	export PATH=/usr/local/sbin:$PATH
fi


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# load pyenv
export PATH="/Users/`whoami`/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --bind=ctrl-f:page-down,ctrl-b:page-up'
export FZF_DIR_COMMAND='fd --type directory --type symlink --hidden --no-ignore --follow  --exclude .git 2> /dev/null'
export FZF_ALT_C_COMMAND="$FZF_DIR_COMMAND"

# reload zsh config
alias reload!='RELOAD=1 source ~/.zshrc'

# substitute homebrew bottles (binary packages)
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

source ~/.iterm2_shell_integration.zsh

#fpath=(/usr/local/share/zsh/functions $fpath)
#compinit


# add color to man pages
export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)

if [ -z ${RELOAD}  ]; then
	umask g-w,o-w

	export ZPLUG_HOME=/usr/local/opt/zplug
	source $ZPLUG_HOME/init.zsh
	zplug 'zplug/zplug', hook-build:'zplug --self-manage'


	zplug "zsh-users/zsh-syntax-highlighting", defer:2
	zplug 'zsh-users/zsh-autosuggestions'
	zplug 'zsh-users/zaw'

	# Install plugins if there are plugins that have not been installed
	if ! zplug check --verbose; then
	    printf "Install? [y/N]: "
	    if read -q; then
		echo; zplug install
	    fi
	fi

	# Then, source plugins and add commands to $PATH
	zplug load
fi

HOMEBREW_NO_AUTO_UPDATE=1

export GOPATH=~/code
export PATH=$GOPATH/bin:$PATH

source ~/.iterm2_shell_integration.zsh

export CHEATCOLORS=true

export HIVE_HOME='/Users/huangmaosen/Downloads/apache-hive-3.1.0-bin'
GO_TORCH='/Users/huangmaosen/repos/FlameGraph'
export PATH="$GO_TORCH:$HIVE_HOME/bin:$PATH"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
export OPENGROK_TOMCAT_BASE=/usr/local/Cellar/tomcat/9.0.10/libexec

prettyjson_s() {
    echo "$1" | python -m json.tool
}

prettyjson_f() {
    python -m json.tool "$1"
}

prettyjson_w() {
    curl "$1" | python -m json.tool
}
