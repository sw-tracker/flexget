#!/bin/sh
export XBMC_HOME=/opt/plexhometheater/share/XBMC
#Use export AE_ENGINE=SOFT to disable pulse audio
#export AE_ENGINE=SOFT
sleep 2
/opt/plexhometheater/bin/plexhometheater &
sleep 2
#touch ~/plex_started
wmctrl -x -r plexhometheater.plexhometheater -e 0,0,-1,-1,-1
wmctrl -x -r plexhometheater.plexhometheater -b add,fullscreen
sleep 1
wmctrl -x -r plexhometheater.plexhometheater -b add,fullscreen
