#!/bin/bash

windowcount=$(yabai -m query --windows --space | jq -r '[ .[] | select(."is-floating" == false and ."subrole" != "AXDialog") ] | length' )
case "${windowcount}" in
        "1")
                display=$( yabai -m query --displays --space | jq )
                width=$( echo $display | jq '.frame.w')
                if [[ "${width}" != "3840" ]]; then
                        yabai -m space --padding abs:10:20:50:1500
                else
                        yabai -m space --padding abs:10:20:50:50
                fi
        ;;
        *)
                yabai -m space --padding abs:10:20:50:50
        ;;
esac
