#!/usr/bin/env bash

INSTALLDIR=${1:-$HOME}

echo "Installing Emacs-Scratch..."
rm -rf $INSTALLDIR/.emacs.d
ln -s $PWD/emacs-scratch.d $INSTALLDIR/.emacs.d
