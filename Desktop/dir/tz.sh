#!/bin/bash
if [ $# -ne 2 ]; then
  echo "Использование: $0 ВХОДНАЯ_ДИРЕКТОРИЯ ВЫХОДНАЯ_ДИРЕКТОРИЯ"
  exit 1
fi
input_dir=$1
output_dir=$2
if [ ! -d "$output_dir" ]; then
  mkdir "$output_dir"
fi
copy_files() {
  current_dir=$1
  for item in "$current_dir"/*; do
    if [ -f "$item" ]; then
      cp "$item" "$output_dir"
    elif [ -d "$item" ]; then
      copy_files "$item"
    fi
  done
}
copy_files "$input_dir"
