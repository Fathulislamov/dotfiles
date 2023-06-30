#!/bin/bash
VOLUME=''
VOLUME_STATUS=$(amixer sget Master | awk -F"[][]" '/Left:/ { print $4}') 

ICON=""
COLOR=""

if [[ "${VOLUME_STATUS}" = "on" ]]; then
	VOLUME="   $(amixer sget Master | awk -F"[][]" '/Left:/ { print $2}')"
else
	VOLUME="  Mute" 
fi

echo "${VOLUME}"

# 
# 
# 
# 
# 
# 
