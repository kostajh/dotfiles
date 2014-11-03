#!/bin/sh

# timestamp of previous mail sync
NBACK=$(date +%s --date="$1 sec ago")
# number of messages after timestamp
NMAIL=$(mu find flag:unread --after=$NBACK 2>/dev/null | wc -l)

if [ $NMAIL -eq 1 ]
then
    notify-send "1 new message"
elif [ $NMAIL -gt 1 ]
then
    notify-send "$NMAIL new messages"
fi
