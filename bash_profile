if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi

# Setting PATH for Python 3.2
# The orginal version is saved in .bash_profile.pysave
export PATH="/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

# MacPorts Installer addition on 2012-07-23_at_15:45:15: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=~/Library/Haskell/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/Applications/yagarto/yagarto-4.7.2/bin
export PATH=$PATH:/Applications/yagarto/yagarto-4.7.2/tools
export VIM_APP_DIR=/Applications

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
