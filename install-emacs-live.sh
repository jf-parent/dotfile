#!/usr/bin/env bash

INSTALLDIR=${1:-$HOME}

echo "Installing emacs-live..."
rm -rf $INSTALLDIR/.emacs.d
ln -s $PWD/emacs-live $INSTALLDIR/.emacs.d
