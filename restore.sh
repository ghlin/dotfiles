#!/bin/sh

THIS="$0"
DEST="$1"

[[ -z $DEST ]] && DEST=$HOME

mkdir -pv $DEST/.config/Code/User
mkdir -pv $DEST/.config/VSCodium/User
mkdir -pv $DEST/.config/fontconfig
mkdir -pv $DEST/.config/htop
mkdir -pv $DEST/.config/tilix/schemes
mkdir -pv $DEST/.config/redshift
mkdir -pv $DEST/.local/lib
mkdir -pv $DEST/.local/bin
mkdir -pv $DEST/.local/share/applications
mkdir -pv $DEST/.local/share/xfce4/terminal/colorschemes

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

for tape in `ls`; do
  restore_config_for $tape
done

# we're inside $DOTFILE_DIR/tapes
[[ -d nvim ]] || (
  mkdir nvim/.config -p;
  echo " => downloading vim config";
  git clone https://github.com/ghlin/vimrc nvim/.config/nvim
)

restore_config_for nvim

