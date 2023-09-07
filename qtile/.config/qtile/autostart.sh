#!/bin/sh

# systray battery icon
cbatticon -u 5 &

# systray volume
volumeicon &

# opacity
picom --no-vsync &

# bg
# feh --bg-fill ~/background.png

# Overlay Bar
~/.local/bin/xob-pulse-py | xob &
#xob-brightness-js | xob -s brightness &

# Apps
megasync &
discord &
udiskie -t &
