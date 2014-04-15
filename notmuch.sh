#!/bin/bash

notmuch new
notmuch tag +gmail +mayfirst -- to:kostajh@gmail.com
notmuch tag +mayfirst -- to:kosta@harlan.mayfirst.org
exit 0
