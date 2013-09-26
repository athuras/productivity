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

alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

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
