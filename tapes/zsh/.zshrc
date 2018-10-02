[[ -f $HOME/.antigen.zsh ]] || curl -L git.io/antigen > $HOME/.antigen.zsh

# source /usr/share/zsh/share/antigen.zsh
source $HOME/.antigen.zsh

export DISABLE_AUTO_UPDATE="true"
export DISABLE_LS_COLORS="true"

plugins=(
  git
  archlinux
)

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle sudo
antigen bundle autojump

antigen theme ghlin
# antigen theme Chicago95

antigen apply

export LANG=en_US.UTF-8

# alias load-nvm="source /usr/share/nvm/init-nvm.sh"
source /usr/share/nvm/init-nvm.sh

alias sale-to-the-py='source /opt/anaconda/bin/activate root'
alias stop-sale-to-the-py='source /opt/anaconda/bin/deactivate root'

# export TERM_BACKGROUND=$(xtermcontrol --get-bg)
# export TERM_FOREGROUND=$(xtermcontrol --get-fg)

update_term_info() {
  export TERM_BACKGROUND=$(xtermcontrol --get-bg)
  export TERM_FOREGROUND=$(xtermcontrol --get-fg)
}

# neovim ignores t_xx, so reshape cursor
# after each prompt.
# function precmd() {
#   print "\033[0 q"
# }

