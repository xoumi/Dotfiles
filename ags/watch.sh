#!/bin/bash

inotifywait -m -r -e close_write --format '%w%f' "." | while read FILENAME
do
    echo "File $FILENAME has been modified."
    ags -q
    ags &
done

