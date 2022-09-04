#!/bin/bash

if [[ $# != 2 ]]
then
    echo "Usage: $0 <TIMEOUT> <COUNT>"
    exit -1
fi

TIMEOUT=$1
COUNT=$2
IMGDIR="./images"
echo "Timeout set to $TIMEOUT sec"
echo "Count of captures set to $COUNT"
echo "Captures will be saved in $IMGDIR"

capture() {
    FILENAME="$IMGDIR/img_$1.jpg"
    raspistill -o $FILENAME
    echo "Capture output saved to $FILENAME"
}

mkdir -p images/
for (( i=0; i<$COUNT; ++i ))
do
    capture $i
done
