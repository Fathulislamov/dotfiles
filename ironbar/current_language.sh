#!/bin/bash
LANG=''
CURRENT_LANGUAGE=$(hyprctl devices | rg -A 2 'at-translated-set-2-keyboard' | grep keymap | awk '{ print $3 }') 

ICON=""
COLOR=""

if [[ "${CURRENT_LANGUAGE}" = "English" ]]; then
	LANG=US
else
	LANG=RU
fi


echo "${LANG}"

# 
# 
# 
# 
# 
# 
