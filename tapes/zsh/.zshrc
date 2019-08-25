[[ -d $HOME/.zgen ]] || git clone https://github.com/tarjoilija/zgen.git "$HOME/.zgen"

source $HOME/.zgen/zgen.zsh

if ! zgen saved; then
  zgen oh-my-zsh

  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/autojump

  zgen load esc/conda-zsh-completion
  zgen load ghlin/zsh-theme-daily daily
  zgen load leophys/zsh-plugin-fzf-finder
  zgen load zsh-users/zsh-completions
  zgen load zsh-users/zsh-syntax-highlighting

  zgen save
fi

export LANG=en_US.UTF-8

# alias load-nvm="source /usr/share/nvm/init-nvm.sh"
source /usr/share/nvm/init-nvm.sh

alias sale-to-the-py='source /opt/anaconda/bin/activate root'
alias stop-sale-to-the-py='source /opt/anaconda/bin/deactivate root'

update_term_info() {
  export TERM_BACKGROUND=$(xtermcontrol --get-bg)
  export TERM_FOREGROUND=$(xtermcontrol --get-fg)
}

todo() {
  done_cmd="done"
  delete_cmd="delete"
  add_cmd="add"

  if [ $#@ -eq 0 ]; then
    task
  elif [ "${done_cmd: :$#1}" == $1 ]; then
    task 'done' ${@:2}
  elif [ "${delete_cmd: :$#1}" == $1 ]; then
    task delete ${@:2}
  else
    task add $@
  fi
}

jj() {
  if [ $#@ -eq 0 ]; then
    cd `cat $HOME/.local/share/autojump/autojump.txt | cut -f 2 | fzf`
  else
    j $@
  fi
}

style() {
  [ -f $1.tsx  ] || echo "import * as style from './$1.scss'" >> $1.tsx
  [ -f $1.scss ] || touch $1.scss
}


tarn() {
  for pkg in $@; do
    echo "Adding type defn for pkg $pkg..."
    yarn add -D @types/$1
  done
}

tdep() {
  for pkg in $@; do
    echo "Adding type defn for pkg $pkg..."
    yarn add -D @types/$1 && yarn add $1
  done
}

# zsh-users/zsh-syntax-highlighting:
# the default style for comments is "fg=black,bold"
# which is hard to read on a dark background
# change it to a more readable color here.
ZSH_HIGHLIGHT_STYLES[comment]="fg=magenta,bold"

# if [ "$TMUX" == "" ]; then
#   exec tmux
# fi

export PYTHONNOUSERSITE=1

alias conda-activate="source /opt/anaconda/bin/activate"
alias conda-deactivate="source /opt/anaconda/bin/deactivate"


