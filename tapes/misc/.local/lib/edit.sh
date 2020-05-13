#!/bin/sh

initial_query=$1

open_file=$(                                        \
  fzf                                               \
    -q "$initial_query"                             \
    --preview "~/.local/lib/code-fzf-preview.sh {}" \
    --preview-window right:70%                      \
    --border         sharp                          \
    --cycle)

function canceled() {
  echo "-- Canceled"
  exit 1
}

if [[ -z "$open_file" ]]; then
  canceled
fi

exec $EDITOR $open_file

# neovim_editor="Neovim"
# neovim_hc_editor="Neovim on Paperlike display"
# use_editor=$(                                                                                             \
#   echo -e "$neovim_editor\n$neovim_hc_editor" |                                                           \
#   fzf --preview "echo \"Edit $(tput setaf 3)$open_file$(tput sgr0) Using $(tput setaf 3){}$(tput sgr0)\"" \
#       --preview-window up                                                                                 \
#       --cycle                                                                                             \
#       --height 15                                                                                         \
#       --border                                                                                            \
#       --margin 2,2,2,2                                                                                    \
#       --header "Which editor to use?")
#
# # 130: ctrl c
# if [[ $? == 130 ]]; then
#   canceled
# fi
#
# case $use_editor in
#   $neovim_hc_editor)
#     PAPERLIKE=PAPERLIKE exec nvim $open_file
#     ;;
#   *)
#     exec nvim $open_file
#     ;;
# esac

