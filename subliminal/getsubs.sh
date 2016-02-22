#!/bin/bash
torrentid=$1
torrentname=$2
torrentpath=$3

cd $torrentpath
subliminal download -l en -a /home/deluge/.config/subliminal.cache.dbm .
