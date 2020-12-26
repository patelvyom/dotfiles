#!/usr/bin/bash

function install_adobe {
	which acroread &> /dev/null

	if [ $? -ne 0]; then
	echo "Installing acrobat"
	sudo apt update
	sudo apt install -y libxml2:i386 libcanberra-gtk-module:i386 gtk2-engines-murrine:i386 libatk-adaptor:i386
	sudo apt-get install gdebi-core
	wget ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb
	sudo gdebi Adbe*.deb
	else
		echo "Already Installed."
	fi
}

while true; 
do
	read -p "Do you wish to install Adobe-Reader 9.x?" yn
	case $yn in
	[Yy]* ) install_abode; break;;
	[Nn]* ) break;;
	* ) echo "Please answer Yy or Nn.";;
	esac
done
