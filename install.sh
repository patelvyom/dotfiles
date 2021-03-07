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

apts=(curl exfat-utils file git htop nmap tmux vim vlc tilix 
	texstudio gimp jpegoptim optipng 
	fonts-firacode fonts-noto default-jdk tlp tlp-rdw
       	gnome-tweak-tool ttf-mscorefonts-installer fonts-powerline
	snapd cmake python3-pip python3-venv tree wget octave 
	r-base build-essential ffmpeg neofetch qbittorrent xclip nomacs flameshot)

snaps=(obs-studio spotify mailspring)


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
