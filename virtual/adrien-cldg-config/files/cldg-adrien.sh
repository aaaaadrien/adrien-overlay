#! /bin/bash

#Set french keyboard if language FR
L=$(echo $LANG | cut -d_ -f1)
K=$(gsettings get org.gnome.desktop.input-sources sources | cut -d\' -f4)

if [[ "$L" == "fr" ]] && [[ "$K" == "us" ]]
then
	gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'fr+oss')]"
fi

# Background
gsettings set org.gnome.desktop.background picture-uri "'file:///usr/share/themes/Calculate/wallpaper.jpg'"

#Theme
gsettings set org.gnome.desktop.interface gtk-theme "Calculate"

# Some things if in live CD
root=$(df / | tail -1 | awk '{ print $1}')
if [[ "$root" == "none" ]]
then
	# When icons on desktop
	#DESKTOP=$(grep XDG_DESKTOP ~/.config/user-dirs.dirs | cut -d\" -f2)
	#cp /etc/calculate/calculate-install.desktop $DESKTOP/
	cp /etc/calculate/calculate-install.desktop /home/$USER/.local/share/applications/
fi


rm -f ~/.config/autostart/cldg-adrien.desktop
