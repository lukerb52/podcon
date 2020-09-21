#!/bin/sh

# A script that converts audio files into formats compatible with media players like the SanDisk Sansa.

folder="Converted_MP3"
timecode=$(date +%s)
pfln="pfl"$timecode
pfl=~/.cache/$pfln #Pod File List

## Indexing Script

find -type f | sed 's/^..//' | grep -i "\.opus\|\.m4a\|\.ogg\|\.webm\|\.mp3" > $pfl

len=$(cat $pfl | wc -l)

echo "$len files to convert."

## Folder Script

if [ -d $folder ]; then
	echo "$folder directory exists. Continuing..."
elif [$len==0]; then
	echo "No music in this directory to convert."
else
	echo "Creating the directory $folder to store the mp3s."
	mkdir $folder
fi

## Conversion Script

for i in `seq 1 $len`
do
	file=$(awk NR==$i $pfl)
	base="${file%.*}"
	ffmpeg -hide_banner -i "$file" -ac 2 $folder/"$base".mp3
done

## Cleanup

rm $pfl
