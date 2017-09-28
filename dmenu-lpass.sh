#!/bin/bash



selection=`lpass ls -l | perl -ne 'if(/([^\/]+) \[id: (.*)\] \[username: (.*)\]/) { if($3) { print "$1 | $3\n"; } else { print "$1\n"; } }' | dmenu -i`

echo "<$selection>"
if [ "$selection" != "" ]; then
    lpass show -c --password "${selection% | *}" &
fi
