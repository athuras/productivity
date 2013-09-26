if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

export PATH=~/Library/Haskell/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/:$PATH
export PATH=$PATH:/Applications/yagarto/yagarto-4.7.2/bin
export PATH=$PATH:/Applications/yagarto/yagarto-4.7.2/tools
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
export PATH=/usr/local/cuda/bin:$PATH
export VIM_APP_DIR=/Applications
export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$HOME/pool/lib:$DYLD_LIBRARY_PATH
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
