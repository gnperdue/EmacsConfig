#!/bin/bash

# Check to see if .emacs and .emacs.d already exist. 
# If they do, archvie them into _bck files. Links to
# a `.emacs.d` doesn't seem to work for emacs.

# Handle `.emacs`
if [ -e $HOME/.emacs ]; then
  if [ -e $HOME/.bak_emacs ]; then
    rm -vf $HOME/.bak_emacs
  fi
  mv -v $HOME/.emacs $HOME/.bak_emacs
fi
# cp ${PWD}/emacs.emacs $HOME/.emacs

# Handle `.emacs.d`
if [ -e $HOME/.emacs.d ]; then
  if [ -e $HOME/.bak_emacs.d ]; then
    rm -rvf $HOME/.bak_emacs.d
  fi
  mv -v $HOME/.emacs.d $HOME/.bak_emacs.d
fi
cp -rv ${PWD}/emacs.d $HOME/.emacs.d
