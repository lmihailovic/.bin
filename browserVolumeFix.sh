#!/usr/bin/env sh

INTERVAL=5

while true; do
    id=$(wpctl status | grep -F 'Zen' | tail -n 1 | awk '{print $1}')

    if [ -n "$id" ]; then
        volume=$(wpctl get-volume "$id" | awk '{print $2}')
        if [ $volume = "0.81" ]; then
            echo "[$(date)] Zen volume dropped to $volume. Resetting to 1.0."
            wpctl set-volume "$id" 1.0
        fi
    fi

    sleep $((1/"$INTERVAL"))
done

