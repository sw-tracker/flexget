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
Copy this file to this location:
```
/home/olga/.config/autostart/plexhometheater.sh.desktop
```

*Important:* Do not user '~' in the desktop file.

#Shutdown PC
Solution found on:
https://forums.plex.tv/discussion/comment/880452#Comment_880452

- Create a backup of this file:
```
sudo cp /opt/plexhometheater/share/XBMC/addons/skin.plex/720p/LeftSideMenu.xml{,.bak}
```

- Execute this to add the shutdown command to Plex:
```
sudo sed -i 's|Plex.Powerdown|System.Exec("dbus-send,--system,--print-reply,--dest='org.freedesktop.login1',/org/freedesktop/login1,org.freedesktop.login1.Manager.PowerOff,boolean:true")|g' /opt/plexhometheater/share/XBMC/addons/skin.plex/720p/LeftSideMenu.xml
```

This essentially replaces the command in the xml code below in the original file, with the System.Exec(...) command that triggers the shutdown.
```
<onclick>Plex.Suspend</onclick>
```

- If using a skin then the LeftSideMenu.xml file is located in:
```
/home/olga/.plexht/addons/<skin name>

i.e. skin.plex_black_editionHT
```

instead of
```
/opt/plexhometheater/share/XBMC/addons/skin.plex/
```

#Install Skins

Download the desired skin and unzip to the path below. Then select the skin via PHT UI.
```
/home/olga/.plexht/addons/
```

I use the black edition skin from: https://forums.plex.tv/categories/plex-black-edition

#Troubleshoot

##Screen Flickers

Plex Home Theater -> Preferences -> Change Preferences for System -> Advanced -> Vertical blank sync -> Enabled during video playback

#Dual Monitor on Ubuntu

Disclaimer: I got this instructions from the link below. I copied them so I'd remember what I did. A big thanks to 'Bits and Pieces' for providing a solution to this issue: http://www.jedrivisser.com/2014/04/plex-dual-monitor-on-ubuntu.html

I had a lot of problems with the Plex client on Ubuntu and my dual monitor setup.

If you run plex in fullscreen mode it detects the screens incorrectly (because of TwinView and xrandr).

The best way I could get to fix this is by running Plex in windowed mode but making it full screen (so it looks like it is in fullscreen mode). This has the added benefit of still allowing you the use of your mouse and keyboard on your other screen.

Unfortunately plex detects the resolution of your screen automatically for windowed mode, and did this incorrectly for me (it set the resolution to 720p, that of my small monitor instead of 1080p), so my plex did not fill the entire screen and had big black borders on two sides.

I fixed this with a bit of a hack, by lying to plex about the xrandr output.

Feel free to give any ideas for better fixes in the comments.

So here is how I got my Plex to work correctly on my two monitors.

##Part 1 - Full screen windowed mode:

- Set Plex to windowed mode:
```
Preferences > System > Advanced > Display Mode > Windowed
```

- Install wmctrl:
```
sudo apt-get install wmctrl
```

- Copy the shell script for plex to your own bin folder and make some changes:
```
mkdir ~/bin
cp /usr/bin/plexhometheater.sh ~/bin/plexhometheater.sh
```

change the content in your own bin folder to:
```
#!/bin/sh
export XBMC_HOME=/opt/plexhometheater/share/XBMC
/opt/plexhometheater/bin/plexhometheater &
sleep 1
wmctrl -x -r plexhometheater.plexhometheater -e 0,0,-1,-1,-1
wmctrl -x -r plexhometheater.plexhometheater -b add,fullscreen
```

Make sure this is executed when you launch plex instead of the original (see .desktop file).
The first 2 line are the same as the original file.
The 3rd line has an added '&' which allow the other lines to be executed.
The 4th line sleeps one second while plex launches.
The 5th line puts plex on the correct screen (the second 0 is the x-coordinate of the plex window), so change that to something like 3000 if you want plex on your second monitor, ex.

```
wmctrl -x -r plexhometheater.plexhometheater -e 0,3000,-1,-1,-1
```

The 6th line makes the window full screen.
Hopefully this is all you need. If your Plex has the wrong resolution then follow part two.

##Part 2 - Change windowed mode resolution:

Plex sets the resolution using its own xrandr binary, so to force the resolution I lied to it.

- Turn off your second screen, keeping only the one you want plex to run on:

In Ubuntu and not Plex go to Settings > System Settings... > Displays and turn off the display you to not want plex on, leaving only the want you want plex to be displayed on.

This lets you get the correct xrandr output for the next step.

- Run Plex's xrandr and save the output:
```
cd /opt/plexhometheater/bin
sudo ./xbmc-xrandr > xrandr.txt
```

- Turn on your second screen again:

Settings > System Settings... > Displays and turn on your second display

- Move xrandr:
```
sudo mv xbmc-xrandr xbmc-xrandr_bac
```

- Create your own xrandr that calls xrandr when it wants to, otherwise returns your txt file:

Use your favourite editor (in my case vim) to create your own xrandr file
```
sudo vim xbmc-xrandr
```

And paste the following
```
#!/bin/bash

if [ "$#" == 0 ]; then
    cat /opt/plexhometheater/bin/xrandr.txt
else
    /opt/plexhometheater/bin/xbmc-xrandr_bac "$@"
fi
```

Save the file and make it executable
```
sudo chmod +x xbmc-xrandr
```

Plex will now call your xrandr instead of the normal one, and you will tell it you only have the high resolution screen connected.

You might want to make a copy of these files somewhere, I do not know if Plex will overwrite the xbmc-xrandr file if it updates.

And that's it, a bit of a hack but it works.
