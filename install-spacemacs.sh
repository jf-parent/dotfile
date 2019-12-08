#!/usr/bin/env bash

INSTALLDIR=${1:-$HOME}

echo "Installing spacemacs..."
rm -rf $INSTALLDIR/.emacs.d
ln -s $PWD/emacs.d $INSTALLDIR/.emacs.d
