# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


plugins=(git zshmarks)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/ahuras/.tools-cache/home/aurora/tools/dottools/bin:/Users/ahuras/.tools-cache/home/francesco/user_tools/oscar/bin:/Users/ahuras/.tools-cache/home/klaplante/bin/capesospy/bin:/Users/ahuras/.tools-cache/home/francesco/user_tools/oscar/bin:/Users/ahuras/.tools-cache/home/devprod/packer/bin:/Users/ahuras/.tools-cache/home/aurora/tools/client/bin:/Users/ahuras/.rbenv/shims:/Users/ahuras/.rbenv/bin:/opt/twitter/nvm/v0.10.30/bin:/opt/twitter/bin:/opt/twitter/sbin:/usr/local/mysql/bin:/Users/ahuras/bin:/Users/ahuras/.twitools/src/twitter-utilities/sbt:/Users/ahuras/.twitools/src/twitter-utilities/sbt11:/Users/ahuras/.twitools/src/twitter-utilities/bin:/opt/twitter/bin:/usr/local/Cellar/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Users/ahuras/.tools-cache/home"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

alias zshconfig="v ~/.zshrc"
alias ohmyzsh="v ~/.oh-my-zsh"

function v() {
  /opt/twitter/Cellar/macvim/7.4-73_1/MacVim.app/Contents/MacOS/Vim $@
}

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# zshmarks aliases
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias p="showmarks"
alias l="showmarks"

