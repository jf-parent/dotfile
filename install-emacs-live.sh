#!/usr/bin/env bash

INSTALLDIR=${1:-$HOME}

echo "Installing Emacs-Live..."
rm -rf $INSTALLDIR/.emacs.d
ln -s $PWD/emacs-live.d $INSTALLDIR/.emacs.d
