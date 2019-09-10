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
local _NVM_INIT="/usr/share/nvm/init-nvm.sh"
[ -f "$_NVM_INIT" ] && source "$_NVM_INIT";

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

typeset -A _NODE_PM_ADD_ARGS_BY_NAME;
typeset -A _NODE_PM_DEV_ADD_ARGS_BY_NAME;
local _NODE_PM_ADD_ARGS_BY_NAME=(npm     'install --save'     yarn 'add');
local _NODE_PM_DEV_ADD_ARGS_BY_NAME=(npm 'install --save-dev' yarn 'add -D');

add-packages() {
  local pm=yarn
  if [[ "$1" == "yarn" || "$1" == "npm" ]]; then
    pm=$1;
    shift
  fi

  for pkg in $@; do
    local command1="$pm ${_NODE_PM_DEV_ADD_ARGS_BY_NAME[$pm]} @types/$pkg"
    local command2="$pm ${_NODE_PM_ADD_ARGS_BY_NAME[$pm]}     $pkg"
    echo "\$ $command1"      \
      && eval "$command1"    \
      && echo "\$ $command2" \
      && eval "$command2"
  done
}

add-dev-packages() {
  local pm=yarn
  if [[ "$1" == "yarn" || "$1" == "npm" ]]; then
    pm=$1;
    shift
  fi

  for pkg in $@; do
    local command1="$pm ${_NODE_PM_DEV_ADD_ARGS_BY_NAME[$pm]} @types/$pkg"
    local command2="$pm ${_NODE_PM_DEV_ADD_ARGS_BY_NAME[$pm]} $pkg"
    echo "\$ $command1"      \
      && eval "$command1"    \
      && echo "\$ $command2" \
      && eval "$command2"
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



