# flexget
My FlexGet Setup on Ubuntu

#Users and Groups

Group: deluge

All users must belong to the group:

Plex linux user: plex

Deluge linux user: deluge

#Manual addition
Copy media to the correct location:
- /media/Movies/<movie name> (<date)>/<filename>
- /media/TV Shows/<series name>/Season <number>/<series name> - S<season number>E<episode number> - <quality>.<file type>

Then correct permissions so deluge group has access:

```
sudo chown -R deluge:deluge /media*
sudo chmod -R u=rwx,g=rwx,o=rx /media/
```

Then get subtitles if necessary:
```
sudo -H -u deluge /var/lib/deluge/.subliminal/getsubs.sh -1 . /media/
```

#TODO:

This is a list of what I still need to do:

- Fix bug with getsubs.sh, folders and files with spaces fail
- Auto download movies on my IMDB.com watchlist.
- Auto start plexhometheater on PC boot (not working at the moment).
- Shutdown PC when the "shutdown" option is selected on PLEX.
- Get remote control working with PLEX (on ubuntu), TV and amplifier.
