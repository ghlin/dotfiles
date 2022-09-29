export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
export GOPATH=$HOME/.local/lib/go
export R_LIBS_USER=$HOME/.local/lib/R
export LANG=en_US.UTF-8

YARN_HOME="$HOME/.local/lib/.yarn"

# HADOOP_INSTALL_DIR=$HOME/.local/lib/hadoop-3.2.2
HBASE_INSTALL_DIR=$HOME/.local/lib/hbase-2.3.6
PHOENIX_INSTALL_DIR=$HOME/.local/lib/phoenix-libs
#PHOENIX_QUERYSERVER_INSTALL_DIR=/opt/phoenix-queryserver-6.0.0

# needed by phoenix-queryserver
# export HADOOP_CONF_DIR=$HADOOP_INSTALL_DIR/etc/hadoop
export HBASE_CONF_DIR=$HBASE_INSTALL_DIR/conf

# path+=$HADOOP_INSTALL_DIR/bin
# path+=$PHOENIX_QUERYSERVER_INSTALL_DIR/bin
path+=$HBASE_INSTALL_DIR/bin
path+=$YARN_HOME/bin
path+=$PHOENIX_INSTALL_DIR/bin
path+=$HOME/.local/bin


export MAKEFLAGS="$MAKEFLAGS --no-print-directory"
export EDITOR=nvim

export JAVA_HOME=/usr/lib/jvm/java-18-openjdk
export HBASE_JAVA_HOME=/usr/lib/jvm/java-8-openjdk

export LS_COLORS="ln=4;32:ow=1;32;107:$LS_COLORS"

# fix 'move to Trash' in Visual Studio Code
# see https://github.com/Microsoft/vscode/issues/13189#issuecomment-370582941
export ELECTRON_TRASH=gio

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias open=xdg-open
alias v=nvim
alias nvi=nvim
alias hvi='PAPERLIKE=PAPERLIKE nvim'
# nvi xxxx <CTRL-A> h -> hnvi xxxx
alias hnvi='PAPERLIKE=PAPERLIKE nvim'
alias hnv='PAPERLIKE=PAPERLIKE nvim'
alias nv=nvim
alias s=stack
alias y=yarn
alias m=make
alias t=ts-node
alias setup-proxy="source $HOME/.local/share/setup-proxy.sh"
alias stack-new="stack --resolver=lts-10.2 new "
alias ag='ag --color-match=4'
alias cv=ydcv
alias e=$HOME/.local/lib/edit.sh
alias ggra='git log --graph --full-history --all --pretty=format:"%h%x09%d%x20%s"'

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
  setfont Tamsyn10x20b
  setvtrgb  /usr/share/kbd/consolecolors/base16-xcode-dusk.vga

  popd > /dev/null
fi

source /usr/share/nvm/init-nvm.sh
