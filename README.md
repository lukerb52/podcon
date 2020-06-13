# Summary

`podcon` is a short GNU shell script that scans a directory for music files and converts them to formats usable by portable MP3 players, such as the SanDisk Sansa.

# Installation & Use

Just download & run `podcon.sh` in the directory you want converted. Converted files will appear in a new subdirectory.

# Prerequisites

* ffmpeg
* The GNU core utilities

# Purpose

Most 2000-era MP3 players (what this program is designed for) don't support every single audio file under the sun.
They are also limited storage wise, so converting video files to the native resolution makes sense.

# Bugs

Currently `podcon` will index music files inside subdirectories, but it doesn't yet convert them.

# TO-DO

* Convert the subdirectory files.
* Add support for video conversion.
* Copy `mp3` files into the output folder (for less copying and pasting).
* Add support for more media players
	* I own a SanDisk Sansa, and am writing this script for that device. If you have another player like it, and want it supported, make a pull request or shoot me an [email](mailto:lukerb52@gmx.com).
