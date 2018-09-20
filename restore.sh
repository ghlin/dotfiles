#!/bin/sh

export DEST=/tmp/HOME

function restore_config_for {
  echo " => restore config for: $1"
  pushd tapes
  stow "$1" -t $DEST -v
  popd
  echo " => done."
  echo ""
}

[[ -d $DEST ]] || mkdir $DEST -p

restore_config_for awesome
restore_config_for Code
restore_config_for fontconfig
restore_config_for htop
restore_config_for tilix
restore_config_for zsh
restore_config_for tmux

[[ -d tapes/nvim ]] || mkdir tapes/vim -p
[[ -d tapes/nvim/.vim ]] || (
  echo " => downloading vim config";
  git clone https://git.coding.net/ghlin/vimrc.git tapes/nvim/.vim
)

restore_config_for nvim

