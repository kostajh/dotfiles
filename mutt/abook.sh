#!/usr/bin/bash
# first update notmuch-abook
for file in $(notmuch search --output=files tag:new) ; do
    cat $file | /usr/local/bin/notmuch-abook update
done
