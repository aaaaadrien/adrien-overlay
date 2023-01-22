#! /bin/bash

pidof gnome-shell
errorgnome=$?

# First lanch of session
if [ ! -e ~/.config/cldg-adrien.conf ] && [ $errorgnome -eq 0 ]
then

	# Background
	gsettings set org.gnome.desktop.background picture-uri "'file:///usr/share/themes/Calculate/wallpaper.jpg'"

	#Theme
	gsettings set org.gnome.desktop.interface gtk-theme "Calculate"
	
	#Curseur
	gsettings set org.gnome.desktop.interface cursor-theme "Adwaita"

	#Icones
	gsettings set org.gnome.desktop.interface icon-theme "Adwaita"

	# Window buttons
	gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

	# Terminal color
	profile=$(gsettings get org.gnome.Terminal.ProfilesList default | sed -e "s/'//g")
	gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-theme-colors "false"
	gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-color "rgb(23,20,33)"
	gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" foreground-color "rgb(208,207,204)"
	
	sleep 1 # Wait 1 second for slow PC
	
	#Set french keyboard if language FR
	L=$(echo $LANG | cut -d_ -f1)
	K=$(gsettings get org.gnome.desktop.input-sources sources | cut -d\' -f4)

	if [[ "$L" == "fr" ]] && [[ "$K" == "us" ]]
	then
		gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'fr+oss')]"
	fi

	sleep 1 # Wait gnome shell loaded 

	# Extensions
	# Classical menu
	#gnome-shell-extension-tool -e apps-menu@gnome-shell-extensions.gcampax.github.com
	# Dash to dock
	gnome-shell-extension-tool -e dash-to-dock@micxgx.gmail.com
	gsettings set "org.gnome.shell.extensions.dash-to-dock" dock-position "BOTTOM"
	gsettings set "org.gnome.shell.extensions.dash-to-dock" dock-fixed false
	gsettings set "org.gnome.shell.extensions.dash-to-dock" autohide-in-fullscreen true 
	# AppIndicator
	gnome-shell-extension-tool -e appindicatorsupport@rgcjonas.gmail.com

	# Add icons
	cp /etc/calculate/cl-console-gui.desktop /home/$USER/.local/share/applications/
	cp /etc/calculate/cl-console-gui-update.desktop /home/$USER/.local/share/applications/


	# Some things if in live CD
	root=$(df / | tail -1 | awk '{ print $1}')
	if [[ "$root" == "none" ]]
	then
		# When icons on desktop
		#DESKTOP=$(grep XDG_DESKTOP ~/.config/user-dirs.dirs | cut -d\" -f2)
		#cp /etc/calculate/calculate-install.desktop $DESKTOP/
		cp /etc/calculate/calculate-install.desktop /home/$USER/.local/share/applications/
	fi

	# Config file creation
	echo "Initial CLDG configuration OK. To force the session to be customized, delete this file. Settings will be applied the next time you connect." >> ~/.config/cldg-adrien.conf
	echo "Configuration initiale CLDG OK. Pour forcer la session à la personnalisation initiale, supprimer ce fichier. Le réglage sera appliqué à la prochaine connexion." >> ~/.config/cldg-adrien.conf
	echo "Начальная конфигурация CLDG OK. Чтобы принудительно персонифицировать сеанс, удалите этот файл. Настройка будет применена при следующем подключении." >> ~/.config/cldg-adrien.conf
fi
