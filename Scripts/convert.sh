#!/usr/bin/bash

# Get input filename without extension
filename=$(echo "$1" | sed -e 's/\..*$//g')

# If no input
[ "$#" -eq 0 ] && echo "Please enter a file or a directory to convert." && exit

# If input is a file
if [[ -f "$1" ]]; then
    echo "Converting file $1 to mp3...."
    ffmpeg -n -i "$1" "$filename.mp3"

# If input is a directory
elif [[ -d "$1" ]]; then
    for input in "$1"/*; do
        filename=$(echo "$input" | sed -e 's/\..*$//g')
        echo "Converting file $input to mp3...."
        [ -f "$input" ] && ffmpeg -n -i "$input" "$filename.mp3"
    done
# If input not exists
else
    echo "Please enter a letter d or f as argument"
fi
