[[ -d $HOME/.zgen ]] || git clone https://github.com/tarjoilija/zgen.git "$HOME/.zgen"

source $HOME/.zgen/zgen.zsh

if ! zgen saved; then
  zgen oh-my-zsh

  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/fzf
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/autojump
  zgen oh-my-zsh plugins/tmuxinator

  zgen load esc/conda-zsh-completion
  zgen load ghlin/zsh-theme-daily daily
  zgen load leophys/zsh-plugin-fzf-finder
  zgen load zsh-users/zsh-completions
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions

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
  local done_cmd="done"
  local delete_cmd="delete"
  local add_cmd="add"

  local input1=$1

  if [[ $#@ -eq 0 ]]; then
    task
  elif [[ "${done_cmd: :$#input1}" == $input1 ]]; then
    task 'done' ${@:2}
  elif [[ "${delete_cmd: :$#input1}" == $input1 ]]; then
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

# zsh-users/zsh-syntax-highlighting:
# the default style for comments is "fg=black,bold"
# which is hard to read on a dark background
# change it to a more readable color here.
ZSH_HIGHLIGHT_STYLES[comment]="fg=magenta,bold"

# zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan,italic"

# if [ "$TMUX" == "" ]; then
#   exec tmux
# fi

export PYTHONNOUSERSITE=0
set-python-usersite() {
  if [ $#@ -eq 0 ]; then
    export PYTHONNOUSERSITE=$((1 - $PYTHONNOUSERSITE))
  else
    export PYTHONNOUSERSITE=$1
  fi

  echo "PYTHONNOUSERSITE => $PYTHONNOUSERSITE"
}

if [ -f "$HOME/.override.zsh" ]; then
  source $HOME/.override.zsh
fi

