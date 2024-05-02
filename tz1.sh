#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_directory> <output_directory>"
    exit 1
fi
input_dir="$1"
output_dir="$2"
if [ ! -d "$input_dir" ]; then
    echo "Дериктории не существует $input_dir ."
    exit 1
fi
mkdir -p "$output_dir"
files=$(find "$input_dir" -type f)
for file in $files; do
    filename=$(basename "$file")
    if [ -f "$output_dir/$filename" ]; then
        filename=$(basename "$(dirname "$file")")"_$filename"
    fi
    cp "$file" "$output_dir/$filename"
done
echo "Файлы скопированы и перенесены из $input_dir в $output_dir."
