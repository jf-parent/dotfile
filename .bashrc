# .bashrc
export EDITOR="vim"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/PROG/PYTHON
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.5
source /usr/local/bin/virtualenvwrapper.sh

set -o vi

# custom functions
if [ -f /root/.bash/aliases ]; then
    . /root/.bash/aliases
fi

export GOPATH=$HOME/PROG/GO
export PATH=$PATH":/home/$USER/bin/:/home/$USER/.local/bin:$GOPATH/bin"

# eval "$(dircolors ~/.bash/.DIR_COLORS)"

#TERM=xterm-256color
TERM=xterm-color
if [ -f $(brew --prefix)/etc/bash_completion ]; then source $(brew --prefix)/etc/bash_completion; fi
