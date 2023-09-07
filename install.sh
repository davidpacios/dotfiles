#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

# Update
sudo pacman -Syu

#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#yay
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git ~
cd ~/yay
makepkg -si
cd ~/.dotfiles/

#initial apps
sudo pacman -S alacritty ranger evince bat exa  cbatticon volumeicon picom discord udiskie rofi qtile pacman-contrib python python-pip
yay brave-bin
yay megasync-bin
yay visual-studio-code-bin

#Python 
pip install psutil #Qtile

#scripts
bash ./rofi/.config/rofi/install-themes.sh
bash ./ranger/.config/ranger/install-plugs.sh

#themes
mkdir ~/.themes
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
sudo pacman -S python-psutil
