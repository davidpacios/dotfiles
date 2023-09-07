#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

# Update
sudo pacman -Syu

#initial apps
sudo pacman -S alacritty ranger evince bat lsd exa cbatticon volumeicon picom discord udiskie rofi qtile pacman-contrib python python-pip python-psutil python-pulsectl fish thunar which pavucontrol brightnessctl ntfs-3g glib2 gvfs geeqie vlc redshift nvim scrot starship alsamixer alsa-utils iwd dhcp 

#X
sudo pacman -S xrandr xorg-xrandr
#nvidia drivers
sudo pacman -S nvidia nvidia-utils nvidia-settings

#yay
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git ~
cd ~/yay
makepkg -si

yay brave-bin
yay megasync-bin
yay visual-studio-code-bin

#Python 
pip install psutil #Qtile

#Git
#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#scripts
bash ./rofi/.config/rofi/install-themes.sh
bash ./ranger/.config/ranger/install-plugs.sh

#themes
mkdir ~/.fonts
cp themes/* ~/.themes/
tar -xf ~/.themes/*.tar.gz

echo -e "${RED}THEMES READY TO INSTALL${NC}"
yay breeze-snow-cursor-theme

#fonts
sudo cp fonts/* /usr/share/fonts/
echo -e "${RED}FONTS READY TO INSTALL${NC}"

#icons
mkdir ~/.icons
cp icons/* ~/.icons/
tar -xf ~/.icons/*.tar.gz
echo -e "${RED}ICONS THEME READY TO INSTALL${NC}"
