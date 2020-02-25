#!/bin/sh

original_encoding=$(uchardet $1)
echo "-- FILE:     $(tput setaf 3)$1$(tput sgr0)"
echo "-- ENCODING: $(tput setaf 3)${original_encoding}$(tput sgr0)"

case original_encoding in
  ASCII)
    cat $1
    ;;
  UTF-8)
    cat $1
    ;;
  *)
    iconv -f $original_encoding -t UTF8 $1
    ;;
esac
