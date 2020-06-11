#!/bin/sh

# A script that converts audio/video files into formats compatible with

file=$(ls -A | grep -i --include=\*.{opus,OPUS} '' | sed -n 1p ) #> ~/.cache/podcon

#ffmpeg -i input.wav -vn -ar 44100 -ac 2 -b:a 192k output.mp3

#echo $og

base="${file%.*}"

ffmpeg -i $og -ac 2
