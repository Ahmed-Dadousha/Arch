#!/usr/bin/bash

filename=$(echo "$1" | sed -e 's/\..*$//g')

[ "$#" -eq 0 ] && echo "Please enter a file or a directory to convert." && exit

# Check If the file exists
if [[ "$2" = "f" ]]; then
	echo "Converting file $1 to mp3...."
	[ -f "$1" ] && ffmpeg -n -i "$1" "$filename.mp3" && exit

	# If file not exists
	echo "File not exists!"

elif [[ "$2" = "d" ]]; then
	for input in "$1"/*; do
		filename=$(echo "$input" | sed -e 's/\..*$//g')
		echo "Converting file $input to mp3...."
		[ -f "$input" ] && ffmpeg -n -i "$input" "$filename.mp3"
	done
else
	echo "Please enter a letter d or f as argument" && exit
fi
