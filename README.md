#My Media Centre Setup

##Overview

###Ubuntu version

Most instructions here were written for Ubuntu 14.04, this uses upstart. From 15.04+, upstart was changed to systemd. I have not switched to systemd and since upstart is still available, you can switch to it permanently with this command:

```
sudo apt-get install upstart-sysv
```
see https://wiki.ubuntu.com/SystemdForUpstartUsers

###PLEX Server

With this I can:

1. View and stream media using Chromecast and the PLEX mobile app to other TVs in the house.

2. View and manage my media via the Plex Web UI.

3. Keep track of which videos I have watched.

3. This uses an ubuntu user called plex and you need to create an account on the plex website.

http://127.0.0.1:32400/web/index.html#

###PLEX Home Theater Client

With this I can display a cooler UI on my main TV.

###Deluge

This is my choice of torrent download software. I run it as a daemon on boot and I use a web user interface to connect to the daemon and manage my downloads.

http://127.0.0.1:8112/

###FlexGet

I use this software to auto-download TV series (using deluge). FlexGet finds the torrents I want and adds them to deluge for download. This means that if a new episode comes out, it will get downloaded and added to my media centre. It runs as a daemon on boot and can be configured to check the torrents site with the 'schedule' configuration.

https://127.0.0.1:3539/ui/

###Subliminal

I use this to download subtitles as soon as an episode or movie is downloaded. This is a script that gets executed from deluge when a torrent is completed.

Sometimes subtitles are out of sync, so this tools helps me fix them with: http://gnome-subtitles.sourceforge.net/ubuntu (on Ubuntu) or http://www.nikse.dk/subtitleedit (on Windows).

###CouchPotato

I use this to autodownload movies. It bypasses flexget, searches a bunch of torrent sites for the right torrent according to size/quality specified and downloads it with deluge. It runs as a daemon on startup.

http://127.0.0.1:5050

###Headphones

I use this to download music. I havent installed it yet.

##Users and Groups

All users must belong to the group: `deluge`

Plex linux user: `plex`

Deluge linux user: `deluge`

CouchPotato user: `couchpotato`

##Manual addition
Copy media to the correct location:
```
- /media/local/Movies/<movie name> (<date)>/<filename>
- /media/local/TV Shows/<series name>/Season <number>/<series name> - S<season number>E<episode number> - <quality>.<file type>
```

Then correct permissions so deluge group has access:

```
sudo chown -R deluge:deluge /media/local/
sudo chmod -R u=rwx,g=rwx,o=rx /media/local/
```

Then get subtitles if necessary:
```
sudo -H -u deluge /var/lib/deluge/.subliminal/getsubs.sh -1 . /media/local/
```

Quick check of video file (check couchpotato for more details). Log is found in `~/.flexget/video_errors.log`.
```
~/.flexget/verify_videos.sh
```

##Media File Structure:

```
- /media/cloud_media/Movies/<movie name> (<date)>/<filename>
- /media/cloud_media/TV Shows/<series name>/Season <number>/<series name> - S<season number>E<episode number> - <quality>.<file type>
- /media/cloud_media/Music/<ArtistName>/<TrackName>.<ext>
```

##TODO:

This is a list of what I still need to do:

- Set correct umask to deluged upstart.
- CouchPotato upstart: add umask.
- Get remote control working with PLEX (on ubuntu), TV and amplifier.
- Add SSH button commands from phone to:
  - Turn laptop off.
  - Poweroff/sleep(on/off) my cloud.
  - Mount my cloud drive.
  - Open plex command.
  - Execute flexget.
- Install headphones software to autodownload music albums.
