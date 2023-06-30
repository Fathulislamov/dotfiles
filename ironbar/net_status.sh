#!/bin/bash
#CURRENT_BACKLIGHT=$(cat /sys/class/backlight/intel_backlight/brightness) 
#MAX_BACKLIGHT=$(cat /sys/class/backlight/intel_backlight/max_brightness)
NETWORK_STATUS=""

GET_NAME=$(LANG=C nmcli -t -f active,ssid dev wifi | grep ^yes | cut -d: -f2-)

ICON=""

if [[ "${GET_NAME}" = "" ]]; then
	NETWORK_STATUS="Disconected"
else
	SIGNAL_LEVEL=$(nmcli -t -f SSID,SIGNAL dev wifi list | grep "${GET_NAME}" | cut -d : -f 2)
	NETWORK_STATUS="   ${GET_NAME} ${SIGNAL_LEVEL}%"
fi
echo "${NETWORK_STATUS}"
#
#󰤟
#󰤢
#󰤥
#󰤨
#󰤭
#󰤯
