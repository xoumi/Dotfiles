#!/usr/bin/bash

# Don't remember exactly where I got this, but this was the starting point:
# https://www.youtube.com/watch?v=36QV8VE5PVY

declare -A URLS

URLS=(
  ["google"]="https://www.google.com/search?q="
  ["github"]="https://github.com/search?q="
  ["youtube"]="https://www.youtube.com/results?search_query="
  ["reddit"]="https://reddit.com/r/"
)

# List for rofi
gen_list() {
    for i in "${!URLS[@]}"
    do
      echo "$i"
    done
}

main() {
  platform=$( (gen_list) | rofi -dmenu -matching fuzzy -only-match -location 0 -p "Which to use ? " )

  query=$(rofi  -dmenu -p "$platform > " )
  if [[ -n "$query" ]]; then
    url=${URLS[$platform]}$query
    xdg-open "$url"
  fi
}

main

exit 0
