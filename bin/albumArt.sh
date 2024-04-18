#!/bin/zsh
album_art=$(playerctl metadata mpris:artUrl | sed 's/file:\/\///')
if [[ -z $album_art ]] 
then
   exit
fi
echo $album_art

