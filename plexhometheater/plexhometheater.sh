#!/bin/sh
export XBMC_HOME=/opt/plexhometheater/share/XBMC
#Use export AE_ENGINE=SOFT to disable pulse audio
#export AE_ENGINE=SOFT
/usr/bin/logger -s -t plexhometheater.sh "Started"
sleep 10
/opt/plexhometheater/bin/plexhometheater &
/usr/bin/logger -s -t plexhometheater.sh "Ran plexhometheater"
sleep 2
#touch ~/plex_started
wmctrl -x -r plexhometheater.plexhometheater -e 0,0,-1,-1,-1
/usr/bin/logger -s -t plexhometheater.sh "Ran wmctrl"
wmctrl -x -r plexhometheater.plexhometheater -b add,fullscreen
/usr/bin/logger -s -t plexhometheater.sh "Ran wmctrl again"
sleep 1
wmctrl -x -r plexhometheater.plexhometheater -b add,fullscreen
/usr/bin/logger -s -t plexhometheater.sh "Ran wmctrl a third time"
