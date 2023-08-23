#!/bin/sh

# systray battery icon
cbatticon -u 5 &

# systray volume
volumeicon &

# opacity
picom &

# Overlay Bar
#xob-pulse-py | xob -s pulse &
#xob-brightness-js | xob -s brightness &

# Apps
megasync &
discord &
udiskie -t &
