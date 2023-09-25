#!/bin/sh

#keyboard layout
setxkbmap es

# systray battery icon
cbatticon -u 5 &

# systray volume
volumeicon &

#nm applet
nm-applet &

# opacity
picom --no-vsync &

# Overlay Bar
~/.local/bin/xob-pulse-py | xob &
python ~/.local/bin/xob-brightness-js | xob &

# Apps
megasync &
#discord &
udiskie -t &
