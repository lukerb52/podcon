#!/bin/sh

# A script that converts audio files into formats compatible with media players like the SanDisk Sansa.

folder="Converted_MP3"
pfl=~/.cache/pfl #Pod File List

rm $pfl

if [ -d "Converted_MP3" ]; then
	echo "$folder directory exists. Continuing..."
else
	echo "Creating the directory $folder to store the mp3s."
	mkdir $folder
fi

find -type f | sed 's/^..//' | grep -i --include=\*.{ogg,OGG,opus,OPUS,m4a,M4A,webm,WEBM} '' > $pfl

len=$(cat $pfl | wc -l)

echo "$len files to convert."

for i in `seq 1 $len`
do
	file=$(awk NR==$i $pfl)
	base="${file%.*}"
	ffmpeg -hide_banner -i "$file" -ac 2 $folder/"$base".mp3
done
