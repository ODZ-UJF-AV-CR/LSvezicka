#!/bin/bash

while true
do
    # write stream 1 hour long
    ffmpeg -i http:/10.10.11.130:81/stream -t 1:00 -c mjpeg ~/data/vezicka/camera/"$(date + "%Y-%m-%d_%R:%S").mjpeg"
    # delete files 5 days old
    find ~/data/vezicka/camera -mtime +1 -type f -delete
done