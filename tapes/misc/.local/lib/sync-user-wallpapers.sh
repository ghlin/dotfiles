#!/bin/sh

SRC_FOLDER=$HOME/Pictures/Wallpapers
DST_FOLDER=/usr/share/backgrounds/User

[[ -d $DST_FOLDER ]] || sudo mkdir -p $DST_FOLDER

sudo rsync $SRC_FOLDER $DST_FOLDER --progress -r

