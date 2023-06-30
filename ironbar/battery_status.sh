#!/bin/bash
BATTERY=0
#BATTERY_INFO=$(acpi -b | grep "Battery ${BATTERY}")
#BATTERY_STATE=$(echo "${BATTERY_INFO}" | grep -wo "Full\|Charging\|Discharging")
#BATTERY_STATE=$(echo (cat /sys/class/power_supply/BAT0/status) )
#BATTERY_POWER=$(echo (cat /sys/class/power_supply/BAT0/capacity))
BATTERY_STATE=$(cat /sys/class/power_supply/BAT0/status) 
BATTERY_POWER=$(cat /sys/class/power_supply/BAT0/capacity)

ICON=""
COLOR=""

if [[ "${BATTERY_STATE}" = "Charging" ]]; then
  	if [[ "${BATTERY_POWER}" -le 94 ]]; then
		ICON=""
  		COLOR="#FFFFFF"
	else
		ICON=""
  		COLOR="#55CC55"
	fi
elif [[ "${BATTERY_STATE}" = "Discharging" ]]; then
	if [[ "${BATTERY_POWER}" -le 10 ]]; then		
		# BATTERY < 10
		ICON=""
		COLOR="#AA2222"
	elif [[ "${BATTERY_POWER}" -le 25 ]]; then
		# 10 < BATTERY < 25
		ICON=""
		COLOR="#FFFFFF"
	elif [[ "${BATTERY_POWER}" -le 50 ]]; then
		# 25 < BATTERY < 50
		ICON=""
		COLOR="#FFFFFF"
	elif [[ "${BATTERY_POWER}" -le 75 ]]; then
		# 50 < BATTERY < 75
		ICON=""
		COLOR="#FFFFFF"
	else 
		# 75 < BATTERY
		ICON=""
		COLOR="#FFFFFF"
	fi
else
	ICON=""
  	COLOR="#FFFFFF"
fi


echo "${ICON}   ${BATTERY_POWER}%  "
#echo "${ICON} ${BATTERY_POWER}%"
#echo $COLOR

# 
# 
# 
# 
# 
# 
