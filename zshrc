# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="kennethreitz"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git zshmarks)

source $ZSH/oh-my-zsh.sh

# User configuration
HOME=/Users/$USER
export PATH="/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:":$PATH
export PATH="/usr/bin":$PATH
export PATH="/usr/local/bin":$PATH
export PATH="/usr/local/Cellar/bin":$PATH

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

bindkey -v # vim mode
export KEYTIMEOUT=1

# osx characters don't work quite as expected...
bindkey "[3~" delete-char
bindkey "^R" history-incremental-search-backward

# Wrapper for vim. This is necessary to avoid segfault w/ youcompleteme
function v() {
  /usr/local/Cellar/macvim/7.4-73_1/MacVim.app/Contents/MacOS/Vim $@
}

# Git functions ###############################################################
# Show the diff from when the current branch diverged from master
function gdiff {
  git diff $@ $(git merge-base HEAD master) HEAD
}

# git patch
function gpatch {
  echo "git add -p && git commit"
  git add -p && git commit
}

function gs {
  git status -uno $@
}

# Make the zsh prompt faster by not tying to git
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Utility Functions ###########################################################
# Recursive egrep in current directory
function dgrep() {
  if [ -z "$1" ]
  then
    echo "dgrep <string_to_find>: find the files that contain the string"
  else
    egrep -Rnl "$1" *
  fi
}

# ls with sorting based on date
function lls {
  ls -l $1 | sort -k6
}

function run_test {
  rootDir=$1
  shift
  echo "[$rootDir] pants goal test $1 --test-specs-test=$2"
  (cd ~/workspace/$rootDir && \
    ./pants goal test $1 --test-specs-test=$2)
}


# Aliases #####################################################################
# zshmarks aliases
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias p="showmarks"
alias l="showmarks"

# various other aliases
alias zshconfig="v ~/.zshrc"
alias ohmyzsh="v ~/.oh-my-zsh"

# Trim down on the correction prompting
unsetopt correct_all

# Start-up
archey
