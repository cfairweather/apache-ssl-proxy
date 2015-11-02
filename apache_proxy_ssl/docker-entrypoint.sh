#!/bin/bash
set -e



# Start and handle Apache
LOCKFILE=/run/apache2/apache2.pid

rm -f $LOCKFILE 
# Previous apache should execute successfully:
source /etc/apache2/envvars; 

# Upon exit, remove lockfile.
trap "{ rm -f $LOCKFILE ; exit 255; }" EXIT

# /usr/sbin/apache2 -D FOREGROUND
apache2ctl -DFOREGROUND
echo "Normal exit after apache2 " && exit 0