#!/usr/bin/env bash

emoji_arrow_down="\u2B07\uFE0F"

destination=""
printf "$emoji_arrow_down Install whichlang. Is $(pwd) the root of your book?\n"
while [ "$destination" == "" ]; do
  read -n 1 -p "[Y/n] " answer; echo
  case "$answer" in
    y | Y | "")
      destination=$(pwd)
      ;;
    n | N)
      echo "Enter the path to the root of your book."
      read destination; echo
      ;;
    *)
      echo "Invalid answer; expected y (yes) or n (no); got '$answer'"
      ;;
  esac
done
echo

script_path="$destination/scripts"
printf "$emoji_arrow_down Enter the directory to put script in (default: $script_path).\n"
read answer; echo
if [ "$answer" != "" ]; then
  script_path="$answer"
fi
echo

style_path="$destination"
printf "$emoji_arrow_down Enter the directory to put the CSS in (default: $style_path).\n"
read answer; echo
if [ "$answer" != "" ]; then
  style_path="$answer"
fi
echo

printf "$emoji_arrow_down Downloading files.\n"
curl -sSf -o "$script_path/whichlang.js" https://raw.githubusercontent.com/phoenixr-codes/mdbook-whichlang/master/dist/whichlang.js
curl -sSf -o "$style_path/whichlang.css" https://raw.githubusercontent.com/phoenixr-codes/mdbook-whichlang/master/src/whichlang.css

