#!/usr/bin/env sh

INTERVAL=5

while true; do
    id=$(wpctl status | grep -F 'Zen' | tail -n 1 | awk '{print $1}')

    if [ -n "$id" ]; then
        volume=$(wpctl get-volume "$id" | awk '{print $2}')

        if [ -n "$volume" ]; then
            is_gt_treshold=$(echo "$volume > 0.8" | bc)
            is_lt_treshold=$(echo "$volume < 1.0" | bc)

            if [ "$is_gt_treshold" -eq 1 ] && [ "$is_lt_treshold" -eq 1 ]; then
            	#echo "[$(date)] Volume is $volume (between 0.8 and 1.0). Resetting to 1.0..."
                wpctl set-volume "$id" 1.0
            fi
        fi
    fi

    sleep $((1/"$INTERVAL"))
done

