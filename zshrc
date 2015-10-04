# Path to your oh-my-zsh installation.
export ZSH=/home/ahuras/.oh-my-zsh

ZSH_THEME="kennethreitz"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git zshmarks)

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/ahuras/.local/bin:/home/ahuras/bin"
export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib64:/usr/lib

source $ZSH/oh-my-zsh.sh

bindkey -v # vim mode
bindkey "" history-incremental-search-backward
bindkey "" history-incremental-search-forward

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export ARCHFLAGS="-arch x86_64"

alias v=vim
alias gv=gvim

function gdiff {
  git diff $@ $(git merge-base HEAD master) HEAD
}

alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias p="showmarks"
alias l="showmarks"

alias zshconfig="gvim ~/.zshrc"
