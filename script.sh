#!/bin/bash

md_files=(posts/*)

for ((i=0; i<${#md_files[@]}; i++)); do
    IFS='/' read -ra markdown_name <<< "${md_files[$i]}"
    IFS='.' read -ra base_name <<< "${markdown_name[1]}"
    echo "$base_name"
    python3 -m markdown "${md_files[$i]}" > pages/"$base_name".html
done


