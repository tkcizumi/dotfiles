# inport .bashrc
if [ -f $HOME/.bashrc ]; then
    . $HOME/.bashrc
fi

# inport .alias
if [ -f $HOME/.alias ]; then
    . $HOME/.alias
fi

# inport .path
if [ -f $HOME/.path ]; then
    . $HOME/.path
fi

# Initialization for FDK command line tools.Fri Mar 31 00:11:26 2017
FDK_EXE="$HOME/bin/FDK/Tools/osx"
PATH=${PATH}:"$HOME/bin/FDK/Tools/osx"
export PATH
export FDK_EXE
