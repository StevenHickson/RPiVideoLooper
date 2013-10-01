RPiVideoLooper
==============

Video Looper for the Raspberry Pi

There are 3 main scripts.

startfullscreen.sh starts the looper script whether X is running or not. So it can work with SSH or headless. It also uses the xterm fullscreen hack to make a black fullscreen no matter the video resolution. It should be in the /home/pi/ directory

startvideos.sh loops through all the videos in the /home/pi/videos/ directory. It should be in the /home/pi/ directory.

videoloop sets up the service and starts it on boot. It calls startfullscreen.sh

The install script is available if you don't want to download the image.

The image can be downloaded here:

