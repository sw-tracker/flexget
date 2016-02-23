#Start plex on browser:
http://127.0.0.1:32400/web/index.html#

#Start plex
~/bin/plexhometheater.sh

#Add media folder

Make sure you add the media folder to the getsubs.sh script chmod command, so that plex can see newly added files from deluge.

#Add Plex User To Deluge Group
Give plex user access or it cant read the new episodes added by deluge:
```
sudo usermod -a -G plex deluge
```

#Start PHT on boot

/home/<me>/.config/autostart/plexhometheater.sh.desktop

#Troubleshoot

##Screen Flickers

Plex Home Theater -> Preferences -> Change Preferences for System -> Advanced -> Vertical blank sync -> Enabled during video playback
