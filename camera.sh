#!/bin/bash

while true
do
    NOW="$(date +"%Y-%m-%d_%R:%S")"
    echo $NOW
    # write stream 1 hour long
    ffmpeg -use_wallclock_as_timestamps 1 -i http:/10.10.11.130:81/stream -t 3600 -c mjpeg ~/data/vezicka/camera/$NOW.mjpeg
    # delete files 5 days old
    #!!!find ~/data/vezicka/camera -mtime +5 -type f -delete
    #sleep 1
done