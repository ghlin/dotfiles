export DISABLE_AUTO_UPDATE=true

[[ -d $HOME/.zgenom ]] || git clone https://github.com/jandamm/zgenom.git "$HOME/.zgenom"

source $HOME/.zgenom/zgenom.zsh

if ! zgenom saved; then
  zgenom ohmyzsh

  zgenom ohmyzsh plugins/git
  zgenom ohmyzsh plugins/fzf
  zgenom ohmyzsh plugins/sudo
  zgenom ohmyzsh plugins/autojump
  zgenom ohmyzsh plugins/tmuxinator

  zgenom load ghlin/zsh-theme-daily daily

  zgenom load buonomo/yarn-completion
  zgenom load zsh-users/zsh-completions

  zgenom load zsh-users/zsh-syntax-highlighting
  zgenom load zsh-users/zsh-autosuggestions

  zgenom save

  zgenom compile "$HOME/.zshenv"
  zgenom compile "$HOME/.zshrc"
fi

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
ZSH_HIGHLIGHT_STYLES[arg0]="none"

# zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=green,bold"

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

if [[ $ZPROF == 1 ]]; then
  zprof
fi

if [[ $ZPROF == 2 ]]; then
  unsetopt XTRACE
  exec 2>&3 3>&-
fi
