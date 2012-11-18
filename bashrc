export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# dark scheme ^ | light scheme below
# export LSCOLORS=ExFxCxDxBxegedabagacad
alias ls='ls -G'
alias ll='ls -la'
alias c='cd'
alias l='ls -G'
alias pi='ipython'
alias pinb='ipython notebook'
alias ipnb='ipython notebook'
alias py='python'
alias rb='ruby'
alias rmr='rm -r'
alias gs='git status' # if I ever need ghost script, drop this
alias p8='ping 8.8.8.8' # to check internet connection

alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin
export PIG_CLASSPATH=/usr/local/bin/jython:$PIG_CLASSPATH
export HADOOP_CLASSPATH=/usr/local/bin/jython:$HADOOP_CLASSPATH
export CLASSPATH=/usr/local/bin/jython:$CLASSPATH
export JAVA_HOME=/usr
export HADOOP_HOME=/usr/local/bin/hadoop
export PYTHONPATH=/usr/loca/bin/python:~/Development/lib:$PYTHONPATH