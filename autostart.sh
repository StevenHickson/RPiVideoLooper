#!/bin/bash

#check to see if autostart is enabled
autostart=`cat /boot/looperconfig.txt | grep autostart | cut -c 11- | tr -d '\r' | tr -d '\n'`
if [[ $autostart -eq 1 ]]; then
    `service videoloop start`
fi
