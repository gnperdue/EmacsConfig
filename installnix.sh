#!/bin/bash

# Check to see if .emacs and .emacs.d already exist. 
# If they do, archvie them into _bck files. Links to
# a `.emacs.d` doesn't seem to work for emacs.

if [ -e $HOME/.emacs ]; then
  mv $HOME/.emacs $HOME/.bak_emacs
fi

if [ -e $HOME/.emacs.d ]; then
  mv $HOME/.emacs.d $HOME/.bak_emacs.d
fi

# ln -s ${PWD}/emacs.emacs $HOME/.emacs
cp -r ${PWD}/emacs.d $HOME/.emacs.d
