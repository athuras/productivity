# My Personal .bashrc. A lot of this is OSX specific, and some of it is really hacky
# i.e. being invoked within a void function. But whatever...

export CLICOLOR=1
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# dark scheme ^ | light scheme below
export LSCOLORS=ExFxCxDxBxegedabagacad
alias ll='ls -l'
alias lls='ls -l | sort -nk5'
alias l='ls -G'
alias c='cd'
alias gs='git status'
alias vim='mvim -v'

alias pi='ipython'
alias ipnb='ipython notebook'
alias py='python'
alias p8='ping 8.8.8.8'
alias julia='/Applications/Julia-0.2.0-rc4.app/Contents/Resources/julia/bin/julia'
alias ipinfo='curl ipinfo.io'

alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

alias broken_pip=/usr/local/Cellar/python/2.7.5/bin/pip

function mkcd() {
	mkdir $1 && cd $1
}

function stash_rdisk() {
	echo "Archiving /Volumes/RamDisk to /usr/local/archive_rdisk"
	rsync -avz /Volumes/RamDisk/* /usr/local/RamDisk_archive
}

function mount_rdisk() {
	echo "Mounting $1 MB RAM Disk at /Volumes/RamDisk"
	diskutil erasevolume HFS+ RamDisk `hdiutil attach -nomount ram://$(expr $1 \* 2048)`
	echo "Pulling from local stash: /usr/local/RamDisk_archive"
	rsync -avz /usr/local/RamDisk_archive/* /Volumes/RamDisk
}

function disable_apple_ftdi() {
	echo "Disabling Mavericks FTDI Driver"
	echo "kextunload /System/Library/Extensions/IOUSBFamily.kext/Contents/PlugIns/AppleUSBFTDI.kext"
	kextunload /System/Library/Extensions/IOUSBFamily.kext/Contents/PlugIns/AppleUSBFTDI.kext
}

function enable_apple_ftdi() {
	echo "Edabling Mavericks FTDI Driver"
	echo "kextload /System/Library/Extensions/IOUSBFamily.kext/Contents/PlugIns/AppleUSBFTDI.kext"
	kextload /System/Library/Extensions/IOUSBFamily.kext/Contents/PlugIns/AppleUSBFTDI.kext
}

function stash_wallet() {
	echo "Copying local wallet to Dropbox"
	cp ~/Library/Application\ Support/Bitcoin/wallet.dat \
		~/Dropbox/Bitcoin/Wallet\ Archives/wallet_$(date "+%Y%m%d").dat
}

function gco() {
	git checkout $1
}


# Utilities for quickly accessing frequently used directories in bash.

# Usage: 
#   $ cd /path/to/project/src/
#   $ mark code     # Will create a new shortcut. 
#                   # Becomes interactive if a shortcut already exists
#                   # m is an alias for mark. You can also `m code`
#
#   $ code          # From now on, running this anywhere in the shell 
#                   # will put you in /path/to/project/src/code
#
#   $ unmark code   # Will remove the symlink and is interactive
#                   # u is an alias for unmark. You can also `u code`

SHELLMARKSDIR="$HOME/.shellmarks"
mkdir -p $SHELLMARKSDIR
function mark_alias { alias $(basename $1)="cd -P $1"; }

function mark { # Mark a directory
    symlink=$SHELLMARKSDIR/$1
    ln -ivhs "$(pwd)" $symlink && mark_alias $symlink
}
alias m=mark

function unmark { # Remove a mark
    symlink=$SHELLMARKSDIR/$1
    rm -iv $symlink
    if [ ! -f $symlink ]; then
        unalias $1
    fi
}
alias u=unmark

function shellmarks { # List all existing marks
    LINK_COLOR=$'\e[1;35m'
    RESET_COLOR=$'\e[0m'
    for symlink in $SHELLMARKSDIR/*; do
        echo "${LINK_COLOR}    $(basename $symlink) ${RESET_COLOR} -> $(readlink $symlink)"
    done
}

for symlink in $SHELLMARKSDIR/*; do # load all existing symlinks as aliases
    mark_alias $symlink
    test -e $symlink || rm $symlink # remove symlinks if source does not exist
done