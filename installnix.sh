#!/bin/bash

# Check to see if .emacs and .emacs.d already exist. If they do, archvie them
# into _bck files unless they are just symbolic links, in which case just
# remove the old links.

if [ -e $HOME/.emacs ]; then
  if [ -L $HOME/.emacs ]; then
    rm $HOME/.emacs
  else
    mv $HOME/.emacs $HOME/.bak_emacs
  fi
fi

if [ -e $HOME/.emacs.d ]; then
  if [ -L $HOME/.emacs.d ]; then
    rm $HOME/.emacs.d
  else
    mv $HOME/.emacs.d $HOME/.bak_emacs.d
  fi
fi

# ln -s ${PWD}/emacs.emacs $HOME/.emacs
ln -s ${PWD}/emacs.d $HOME/.emacs.d
