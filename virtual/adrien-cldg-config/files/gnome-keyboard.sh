#! /bin/bash

#Set french keyboard if language FR
L=$(echo $LANG | cut -d_ -f1)
K=$(gesttings get org.gnome.desktop.input-sources sources | cut -d\' -f4)

if [[ "$L" == "fr" ]] && [[ "$K" == "us" ]]
then
	gesttings set org.gnome.desktop.input-sources sources "[('xkb', 'fr+oss')]"
fi
