#!/bin/bash

input_dir=$1

output_dir="$HOME/.cache/wallpapers"
mkdir -p "$output_dir"

rm -rf $output_dir/*

for img in "$input_dir"/*.{jpg,jpeg,png,gif,bmp,tiff}; do
    [ -e "$img" ] || continue
    filename=$(basename "$img")
    
    magick "$img" -thumbnail x768 "$output_dir/${filename%.*}.jpg"
done

echo "Thumbnails created in $output_dir"

