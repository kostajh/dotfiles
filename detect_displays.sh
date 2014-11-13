#!/bin/bash
# Both commands need to be run for the display to switch on properly.
DISPLAY=:0 xrandr --output HDMI1 --auto
DISPLAY=:0 xrandr --output HDMI1 --right-of LVDS1
