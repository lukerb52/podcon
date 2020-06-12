#!/bin/sh

# A script that converts audio/video files into formats compatible with media players like the SanDisk Sansa.

folder="Converted_MP3"
pfl=~/.cache/pfl #Pod File List

ls -A -p | grep -v / | grep -i --include=\*.{ogg,OGG,opus,OPUS,m4a,M4A,webm,WEBM} '' > $pfl
len=$(cat $pfl | wc -l)

echo $len

if [ -d "Converted_MP3" ]; then
    echo "$folder directory exists. Continuing..."
else
	mkdir $folder
fi

for i in `seq 1 $len`
do
	file=$(awk NR==$i $pfl)
	base="${file%.*}"
	ffmpeg -hide_banner -i "$file" -ac 2 $folder/"$base".mp3
done
