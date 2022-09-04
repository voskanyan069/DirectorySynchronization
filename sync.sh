#!/bin/bash

if [[ $# != 3 ]]
then
    echo "Usage: $0 <PATH> <USERNAME@HOSTNAME:PATH> <PASSWORD>"
    exit -1
fi

EVENTS="CREATE,DELETE,MODIFY,MOVED_FROM,MOVED_TO"
PICSPATH=$1
USERHOST=$2
PASSWORD=$3

sync() {
    sshpass -p $PASSWORD rsync --bwlimit=1466 --update -alvzr $PICSPATH $USERHOST
}

watch() {
    inotifywait -e "$EVENTS" -m -r --format '%:e %f' $PICSPATH
}

watch | (
while true ; do
    read -t 1 LINE && sync
done
)
