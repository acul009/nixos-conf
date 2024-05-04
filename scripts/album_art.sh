#!/usr/bin/env bash
album_art=$(playerctl -p spotify metadata mpris:artUrl)
if [[ -z $album_art ]] 
then
   # spotify is dead, we should die too.
   rm "$HOME/.cache/current_song"
   exit
fi
wget -nc -P "$HOME/.cache/song-images" $album_art
filename="$HOME/.cache/song-images/$(basename $album_art)"
ln -s -f "$filename" "$HOME/.cache/current_song"
echo $filename