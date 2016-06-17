#!/bin/bash

WATCH_DIR=$1

echo "Watching $WATCH_DIR"

while true; do
  inotifywait -r -e modify -e delete --exclude '-journal$' $WATCH_DIR | while read FILE; do
    event=$(echo $FILE | awk '{print $2}')
    file=$(echo $FILE | awk '{print $1$3}')

    cd $WATCH_DIR

    if [ "$event" == "MODIFY" ]; then
      git add $file
    elif [ "$event" == "DELETE" ]; then
      git rm -f $file
    fi

    git pull
    git commit -m "Change made to $file"
    git push
  done
done
