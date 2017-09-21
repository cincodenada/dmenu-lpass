#!/bin/bash


selection=`lpass ls | awk -F '[/[]' '$0 !~ /\/ \[id/ {gsub(/ $/,"",$(NF-1)); print $(NF-1)}' | dmenu -i`

echo "<$selection>"
if [ "$selection" != "" ]; then
    lpass show -c --password "$selection" &
fi
