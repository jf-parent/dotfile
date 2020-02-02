#!/usr/bin/env bash

INSTALLDIR=${1:-$HOME}

echo "Installing Spacemacs..."
rm -rf $INSTALLDIR/.emacs.d
ln -s $PWD/spacemacs.d $INSTALLDIR/.emacs.d
