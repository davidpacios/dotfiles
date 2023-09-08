#!/bin/bash

if [ "$1" == "" ]; then
    var="n"
elif [ "$1" == "-a" ]; then
    var=" "
else
    echo "Help:"
    echo "	NO arguments: Simulation mode"
    echo "	-a: Effective mode"
fi



stow -v$var alacritty
stow -v$var fish
stow -v$var gtk-4.0
stow -v$var ranger
stow -v$var startship
stow -v$var wallpaper
stow -v$var bat
stow -v$var gtk-3.0
stow -v$var qtile
stow -v$var rofi

