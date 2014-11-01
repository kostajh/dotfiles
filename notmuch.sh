#!/bin/bash

notmuch new
notmuch tag +gmail +mayfirst -- to:kostajh@gmail.com
notmuch tag +mayfirst -- to:kosta@harlan.mayfirst.org
notmuch tag +mayfirst -- to:kosta@kostaharlan.net
UNREAD=$(mu --muhome=~/mail/mayfirst find flag:unread)
if [ "$?" -eq 0 ]; then
    COUNT=$(mu find --muhome=~/mail/mayfirst  flag: unread | wc -l)
    MESSAGE="messages"
    if [[ $COUNT == 1 ]]; then
        MESSAGE="message"
    fi
    notify-send "$COUNT new $MESSAGE" -c email
fi
exit 0
