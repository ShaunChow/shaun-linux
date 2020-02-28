#!bin/bash

xrandr --newmode "2880x1800"  442.00  2880 3104 3416 3952  1800 1803 1809 1865 -hsync +vsync

xrandr --addmode Virtual1 2880x1800

xrandr --output Virtual1 --mode 2880x1800

echo 'Adjust Mac Pro 2015 Screen Solution to 2880x1800'