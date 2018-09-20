#!/bin/sh

THIS="$0"
DEST="$1"

[[ -z $DEST ]] && DEST=$HOME

echo " ** target dir is $DEST"

if [ -L "$THIS" ]; then
  THIS=`readlink "$THIS"`
fi

DOTFILES_DIR=`dirname "$THIS"`

pushd $DOTFILES_DIR/tapes

function restore_config_for {
  echo " => restore config for: $1"
  stow "$1" -t $DEST -v
  echo " => done."
  echo ""
}

[[ -d $DEST ]] || mkdir $DEST -p

restore_config_for Code
restore_config_for fontconfig
restore_config_for htop
restore_config_for tilix
restore_config_for zsh
restore_config_for tmux

# we're inside $DOTFILE_DIR/tapes
[[ -d nvim ]] || mkdir vim -p
[[ -d nvim/.vim ]] || (
  echo " => downloading vim config";
  git clone https://git.coding.net/ghlin/vimrc.git nvim/.vim
)

restore_config_for nvim

