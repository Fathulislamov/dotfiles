#!/bin/bash
CURRENT_BACKLIGHT=$(cat /sys/class/backlight/intel_backlight/brightness) 
MAX_BACKLIGHT=$(cat /sys/class/backlight/intel_backlight/max_brightness)

ICON=""

BACKLIGHT=$((CURRENT_BACKLIGHT * 100 / MAX_BACKLIGHT))

echo "${ICON} ${BACKLIGHT}%"
#echo "${ICON} ${BATTERY_POWER}%"
#echo $COLOR

# 
# 
# 
# 
# 
# 
