#! /bin/bash

#Set french keyboard if language FR
L=$(echo $LANG | cut -d_ -f1)
K=$(gsettings get org.gnome.desktop.input-sources sources | cut -d\' -f4)

if [[ "$L" == "fr" ]] && [[ "$K" == "us" ]]
then
	gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'fr+oss')]"
fi

# Background
B=$(gsettings get org.gnome.desktop.background picture-uri)
if [[ "$B" == "'file:///usr/share/backgrounds/gnome/adwaita-timed.xml'" ]]
then
	gsettings set org.gnome.desktop.background picture-uri "'file://usr/share/themes/Calculate/wallpaper.jpg'"
fi
