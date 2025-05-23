#!/usr/bin/env bash
url="$1"

# If no URL
[ -z "$url" ] && exit

# Stream type
type=$(echo -e "video\naudio" | fzf)
audio_path="/home/adosha/Downloads/audio"
video_path="/home/adosha/Downloads/video"
download_audio() {
	# Get Itag number for best rate
	itag=$(pytubefix "$url" --list | rg "audio" | awk '{print $5, $4, $3}' | sort -t '"' -k2,2nr -k2.3r | head -n 1 | awk -F 'itag="' '{print $2}' | tr -d '"')
	# Download the audio
	pytubefix "$url" --target="$audio_path" --itag="$itag" && convert.sh "$audio_path" && find "$audio_path" -type f ! -name "*.mp3" -delete
}

# Downoad Best Audio
if [[ "$type" = "audio" ]]; then
	download_audio

# Download Video
elif [[ "$type" = "video" ]]; then
	itag=$(pytubefix "$url" --list | rg "video" | rg -v "True" | rg "mp4" | awk '{print $5, $4, $3}' | awk '!seen[$1]++' | sort -t '"' -k2,2nr -k2.3r | awk '{print $1, $3}' | fzf | awk -F 'itag="' '{print $2}' | tr -d '"')
	# Download the video
	pytubefix "$url" --target="$video_path" --itag="$itag"

	# Donwload The Audio
	download_audio

	# Mergre Them
	audio="$audio_path/$(ls -t "$audio_path" | head -n 1)"
	video="$video_path/$(ls -t "$video_path" | head -n 1)"
	output=$(ls -t "$video_path" | head -n 1)
	ffmpeg -i "$video" -i "$audio" -c:v copy -c:a aac -strict experimental "$video_path/final/$output"

	# Remove original files
	rm "$audio" "$video"
fi
