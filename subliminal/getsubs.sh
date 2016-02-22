#!/bin/bash
torrentid=$1
torrentname=$2
torrentpath=$3

echo "Torrent Details: " $torrentpath $torrentname $torrentid  > /var/lib/deluge/.subliminal/subliminal.log
cd $torrentpath
subliminal download -l en -a /var/lib/deluge/.subliminal/subliminal.cache.dbm . >> /var/lib/deluge/.subliminal/subliminal.log
