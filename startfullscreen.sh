#!/bin/sh
if [ -z $DISPLAY ] ; then
	DISPLAY=:0
	`/home/pi/startvideos.sh`
else
	`xterm -fullscreen -fg black -bg black -e /home/pi/startvideos.sh`
fi
