#!/bin/bash

INSTALLDIR=${1:-$HOME}

if [ "$1" == "-h" ] || [ "$1" == "-?" ] || [ "$1" == "--help" ]; then
    echo "$0 <dotfiles install dir>"
    echo "Existing dotfiles will be moved to <filename>.old"
    exit
fi

#BASH
for i in .bash  .bash_logout  .bashrc 
do
    mv $INSTALLDIR/$i $INSTALLDIR/$i.old 2> /dev/null
    ln -s $PWD/$i $INSTALLDIR/$i;
done;

#VIM
mv $INSTALLDIR/.vim $INSTALLDIR/.vim.old
mv $INSTALLDIR/.vimrc $INSTALLDIR/.vimrc.old
ln -s $PWD/vim $INSTALLDIR/.vim 2> /dev/null
ln -s $PWD/vimrc $INSTALLDIR/.vimrc 2> /dev/null

#TMUX
mv $INSTALLDIR/.tmux.conf $INSTALLDIR/.tmux.config.old
ln -s $PWD/tmux $INSTALLDIR/.tmux 2> /dev/null
ln -s $PWD/tmux.conf $INSTALLDIR/.tmux.conf 2> /dev/null
ln -s $PWD/tmux.conf.local $INSTALLDIR/.tmux.conf.local 2> /dev/null

#SPACEMACS
mv $INSTALLDIR/.spacemacs $INSTALLDIR/.spacemacs.old
ln -s $PWD/spacemacs $INSTALLDIR/.spacemacs 2> /dev/null
mv $INSTALLDIR/.emacs.d $INSTALLDIR/.emacs.d.old
ln -s $PWD/emacs.d $INSTALLDIR/.emacs.d 2> /dev/null

#PSQL
mv $INSTALLDIR/.psqlrc $INSTALLDIR/.psqlrc.old
ln -s $PWD/psqlrc $INSTALLDIR/.psqlrc 2> /dev/null

echo "Done. Conflicting existing dotfiles were moved to <file>.old"
