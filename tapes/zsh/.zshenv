export PATH=$HOME/.local/lib/llvm/bin:$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.local/share/go/bin:$PATH
export EDITOR=nvim

# fix 'move to Trash' in Visual Studio Code
# see https://github.com/Microsoft/vscode/issues/13189#issuecomment-370582941
export ELECTRON_TRASH=gio

alias open=xdg-open
alias vim=nvim
alias vi=nvim
alias s=stack
alias setup-proxy="source $HOME/.local/share/setup-proxy.sh"
alias stack-new="stack --resolver=lts-10.2 new "
alias goodjob="task del"
alias ag='ag --color-match=4'
alias :e=nvim
alias :q=exit
alias cv=ydcv

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
