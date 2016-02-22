#!/bin/bash
torrentid=$1
torrentname=$2
torrentpath=$3

echo "Torrent Details: " $torrentpath $torrentname $torrentid  > /var/lib/deluge/.subliminal/subliminal.log
cd $torrentpath
subliminal --cache-dir /var/lib/deluge/.subliminal/ download -l en $torrentname >> /var/lib/deluge/.subliminal/subliminal.log
