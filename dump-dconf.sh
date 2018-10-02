#!/bin/sh

THIS="$0"

if [ -L "$THIS" ]; then
  THIS=`readlink "$THIS"`
fi

DOTFILES_DIR=`dirname "$THIS"`

function dump {
  dconf dump $1 > "$DOTFILES_DIR/dconf-dumps/$2"
}

function load {
  dconf load $1 < "$DOTFILES_DIR/dconf-dumps/$2"
}

function doit {
  echo " ==> $1: " "$2" "$3"
  if [ $1 == "dump" ]; then
    dump $2 $3;
  else
    load $2 $3;
  fi
}

doit $1 /com/gexperts/Tilix/ tilix.dconf
