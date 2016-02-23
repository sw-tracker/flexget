#!/bin/bash
torrentid=$1
torrentname=$2
torrentpath=$3

#log input parameters for debugging in case of error
echo "Torrent Details: " $torrentpath $torrentname $torrentid  > /var/lib/deluge/.subliminal/subliminal.log
#move to the folder where the file is located
cd "$torrentpath"
#download subtitles for all files in that folder
#we could use torrentname instead of 'dot' but I personally prefer it this way because I use this script during manual download
subliminal --cache-dir /var/lib/deluge/.subliminal/ download -l en . >> /var/lib/deluge/.subliminal/subliminal.log
#fix permissions on new folder and files so plex can see them
chmod -R u=rwx,g=rwx,o=rx "$torrentpath" >> /var/lib/deluge/.subliminal/subliminal.log
