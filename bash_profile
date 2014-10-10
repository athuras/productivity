if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local:$PATH
export MANPATH=/usr/local/opt/erlang/lib/erlang/man:$MANPATH
export PYLEARN2_DATA_PATH=/data

set -o vi
