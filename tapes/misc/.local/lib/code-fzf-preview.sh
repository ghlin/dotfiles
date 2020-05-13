#!/bin/sh

input_file=$1
original_encoding=$(uchardet $input_file)

if (file -L $input_file | grep text -q) || [[ $original_encoding != "unknown" ]]; then
  lines=$(wc -l < $input_file)
  echo "FILE: $(tput setaf 3)$1$(tput sgr0) - $(tput setaf 3)$lines Ln$(tput sgr0)"

  case original_encoding in
    unknown)
      cat $1
      ;;
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
else
  echo "BINARY FILE: $(tput setaf 3)$input_file$(tput sgr0)"
fi
