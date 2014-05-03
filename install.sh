# Make sure only root can run this script
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

cp -a startvideos.sh /home/pi/
cp -a startfullscreen.sh /home/pi/
cp -a videoloop /etc/init.d/
cp -a autostart.sh /home/pi/
cp -a videoloop_starter /etc/cron.d/
cp -a looperconfig.txt /boot/
#update-rc.d videoloop defaults
