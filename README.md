#My Media Centre Setup

##Setup

I setup the following software:

###PLEX Server

With this I can:
1. View and stream media using Chromecast to other TVs in the house.
2. View and manage my media via the Plex Web UI.
3. Keep track of which videos I have watched.
3. This uses an ubuntu user called plex and you need to create an account on the plex website.

###PLEX Home Theater Client

With this I can:
1. Display a cooler UI on my main TV.

###Deluge

This is my choice of torrent download software. I use a web user interface to manage my downloads.

###FlexGet

I use this software to auto-download TV series (using deluge). This means that if a new episode comes out, it will get downloaded and added to my media centre.

###Subliminal

I use this to download subtitles as soon as an episode or movie is downloaded.

##Users and Groups

Group: deluge

All users must belong to the group:

Plex linux user: plex

Deluge linux user: deluge

##Manual addition
Copy media to the correct location:
```
- /media/Movies/<movie name> (<date)>/<filename>
- /media/TV Shows/<series name>/Season <number>/<series name> - S<season number>E<episode number> - <quality>.<file type>
```

Then correct permissions so deluge group has access:

```
sudo chown -R deluge:deluge /media*
sudo chmod -R u=rwx,g=rwx,o=rx /media/
```

Then get subtitles if necessary:
```
sudo -H -u deluge /var/lib/deluge/.subliminal/getsubs.sh -1 . /media/
```

##Media File Structure:

```
- /media/Movies/<movie name> (<date)>/<filename>
- /media/TV Shows/<series name>/Season <number>/<series name> - S<season number>E<episode number> - <quality>.<file type>
- /media/Music/<ArtistName>/<TrackName>.<ext>
```

##TODO:

This is a list of what I still need to do:

- Auto download movies on my IMDB.com watchlist.
- Remove sleep and suspend buttons from Plex.
- Get remote control working with PLEX (on ubuntu), TV and amplifier.
