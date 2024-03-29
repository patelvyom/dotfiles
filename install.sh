#!/usr/bin/bash

sudo apt update

function apt_install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

function snap_install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo snap install $1
  else
    echo "Already installed: ${1}"
  fi
}



# Programs from default apt repo

apts=(curl exfat-utils file git htop nmap tmux vim-gtk vlc tilix gimp jpegoptim optipng	fonts-firacode fonts-noto
    ttf-mscorefonts-installer fonts-powerline gnome-tweak-tool snapd cmake python3-pip python3-venv tree wget 
    r-base r-cran-devtools build-essential ffmpeg qbittorrent xclip nomacs flameshot ncdu visidata remmina lm-sensors
    mediainfo-gui parallel nautilus-admin nvtop obs-studio okular)

snaps=(mailspring mathpix-snipping-tool)

echo "Starting...\n"
for program in "${apts[@]}"
do
	apt_install $program
done


# Ask explicitly if texlive-full is required.
while true; do
    read -p "Do you wish to install texlive-full?" yn
    case $yn in
        [Yy]* ) install texlive-full; break;;
        [Nn]* ) break;;
        * ) echo "Please answer Yy or Nn";;
    esac
done

which snap &> /dev/null

  if [ $? -eq 0 ]; then
    for program in "${snaps[@]}"
	do
        	snap_install $program
	done

  else
    echo "Snap installation not found!"
  fi


# Run all scripts in programs/
for f in programs/*.sh; do bash "$f" -H; done

# Get all upgrades
sudo apt upgrade -y
sudo apt autoremove -y

echo "\nDone!\n"
