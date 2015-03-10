#!/bin/bash

declare -A vids

#Make a newline a delimiter instead of a space
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

configs=`cat /boot/looperconfig.txt`
usb=`echo "$configs" | grep usb | cut -c 5- | tr -d '\r' | tr -d '\n'`
audio_source=`echo "$configs" | grep audio_source | cut -c 14- | tr -d '\r' | tr -d '\n'`
seamless=`echo "$configs" | grep seamless | cut -c 10- | tr -d '\r' | tr -d '\n'`

FILES=/home/pi/videos/

if [[ $usb -eq 1 ]]; then
    FILES=/media/USB/videos/
fi

if [ -n "$seamless" ] && [[ ! "$seamless" -eq 0 ]]; then
    #run the seamless looper
    echo "seamless isn't 0"
    `/opt/vc/src/hello_pi/hello_video/hello_video.bin "$FILES$seamless"`
    exit 0
fi

current=0
for f in `ls $FILES | grep ".mp4$\|.avi$\|.mkv$\|.mp3$\|.mov$\|.mpg$\|.flv$\|.m4v$"`
do
        vids[$current]="$f"
        let current+=1
	echo "$f"
done
max=$current
current=0

#Reset the IFS
IFS=$SAVEIFS

while true; do
if pgrep omxplayer > /dev/null
then
	echo 'running'
else
	let current+=1
	if [ $current -ge $max ]
	then
		current=0
	fi

	/usr/bin/omxplayer -r -o "$audio_source" "$FILES${vids[$current]}"
fi
done
