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
#picom --no-vsync &
unagi &


# Overlay Bar
#~/.local/bin/xob-pulse-py | xob -s pulse &
#python ~/.local/bin/xob-brightness-js | xob -s brightness &

# Apps
megasync &
#discord & 
udiskie -t &
