#!/bin/bash

EVENTS="CREATE,DELETE,MODIFY,MOVED_FROM,MOVED_TO"

sync() {
    sshpass -p '\' rsync --bwlimit=1466 --update -alvzr --exclude '*.sh' --exclude '.git/' ./ andranik@10.5.0.1:/home/andranik/projects/wifibroadcast/sync_dir
}

watch() {
    inotifywait -e "$EVENTS" -m -r --format '%:e %f' ./ --exclude '*.sh' --exclude '.git/'
}

watch | (
while true ; do
    read -t 1 LINE && sync
done
)
