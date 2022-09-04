#!/bin/bash

TIMEOUT=1
COUNT=100

if [[ $1 != "" ]]
then
    TIMEOUT=$1
fi
echo "Timeout set to $TIMEOUT sec"

if [[ $2 != "" ]]
then
    COUNT=$2
fi
echo "Count of captures set to $COUNT"

capture() {
    FILENAME="./img_$1.jpg"
    raspistill -o $FILENAME
    echo "Capture output saved to $FILENAME"
}

for (( i=0; i<$COUNT; ++i ))
do
    capture $i
done
