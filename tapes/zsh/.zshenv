export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
export PATH=$HOME/.local/lib/llvm/bin:$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.local/share/go/bin:$PATH
export EDITOR=nvim

export LS_COLORS="ln=4;32:ow=1;32;107:$LS_COLORS"

# fix 'move to Trash' in Visual Studio Code
# see https://github.com/Microsoft/vscode/issues/13189#issuecomment-370582941
export ELECTRON_TRASH=gio

alias open=xdg-open
alias nvi=nvim
alias hvi='PAPERLIKE=PAPERLIKE nvim'
# nvi xxxx <CTRL-A> h -> hnvi xxxx
alias hnvi='PAPERLIKE=PAPERLIKE nvim'
alias hnv='PAPERLIKE=PAPERLIKE nvim'
alias nv=nvim
alias ng=nvim-gtk
alias s=stack
alias setup-proxy="source $HOME/.local/share/setup-proxy.sh"
alias stack-new="stack --resolver=lts-10.2 new "
alias ag='ag --color-match=4'
alias cv=ydcv

function toggleproxy() {
  if [[ -z "$HTTP_PROXY" || -z "$HTTPS_PROXY" || -z "$ALL_PROXY" ]]; then
    source $HOME/.local/share/setup-proxy.sh
    echo "proxy on"
  else
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset ALL_PROXY
    echo "proxy off"
  fi
}

export XDG_CONFIG_HOME="$HOME/.config"
if [[ $TILIX_ID ]]; then
  source /etc/profile.d/vte.sh
fi

# check if tty terminal
TTY=$(tty)
if [[ "${TTY: :-1}" == "/dev/tty" ]]; then
  pushd /usr/share/kbd/consolefonts > /dev/null
  setfont Tamsyn8x16r
  popd > /dev/null
fi

