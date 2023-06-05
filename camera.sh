#!/bin/bash

while true
do
    NOW="$(date +"%Y-%m-%d_%R:%S")"
    echo $NOW
    # write stream 1 hour long
    ffmpeg -i http:/10.10.11.130:81/stream -t 1:00:00 -c mjpeg ~/data/vezicka/camera/$NOW.mjpeg
    # delete files 5 days old
    find ~/data/vezicka/camera -mtime +5 -type f -delete
    sleep 1
done