#!/bin/sh

# A script that converts audio/video files into formats compatible with

file=$(ls -A | grep -i --include=\*.{ogg,OGG,opus,OPUS,m4a,M4A} '' | sed -n 1p ) #> ~/.cache/podcon

echo $file

#bs=$(echo $file | sed 's/ /\\ /g')

#echo $bs

#tk=$(echo $file | sed 's/ /_/g')

#echo $tk

#cp $bs $tk

if [ -d "mp3" ]; then
    echo "mp3 is a directory."
else
	mkdir mp3
fi

base="${file%.*}"

echo $base

echo "$file"

ffmpeg -hide_banner -i "$file" -ac 2 mp3/"$base".mp3

#ffmpeg -i input.wav -vn -ar 44100 -ac 2 -b:a 192k output.mp3
