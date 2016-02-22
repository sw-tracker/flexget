#Deluge-web:
http://localhost:8112/

#Start/Stop (manual):
sudo start deluged

#Start on boot:
/etc/init/deluged.conf
/etc/init/deluge-web.conf

#Setup (backup in case page goes down):
http://www.havetheknowhow.com/Install-the-software/Install-Deluge-Headless.html

##How to install Deluge (v1.3.x) headless on Ubuntu Server

Deluge is a great BitTorrent client that you can install on Ubuntu to allow you to share your favourite files with the rest of the BitTorrent community.

In the newer versions of Ubuntu, Deluge comes in two parts; the server (also called the daemon) and the user interface. This means you can install the Deluge daemon as a headless service and then control it from a remote machine. You can either control the daemon using the Deluge client itself (for example the Windows version of Deluge) or alternatively you can use your browser to control it. If you've not installed VNC and are running a purely headless setup then running Deluge headless is pretty much your only option! So, here's how you install it:

At the time of writing Deluge version 1.3.11 is the most up to date release for Trusty Tahr 14.04LTS.

So, first off we need to create a new user called "deluge" and perform a couple more steps:

> sudo adduser --disabled-password --system --home /var/lib/deluge --gecos "SamRo Deluge server" --group deluge

> sudo touch /var/log/deluged.log

> sudo touch /var/log/deluge-web.log

> sudo chown deluge:deluge /var/log/deluge*

##Install the Deluge Daemon

Next we'll install the Deluge daemon itself:

> sudo apt-get update

> sudo apt-get install deluged

Next we'll install the Web interface by typing:

> sudo apt-get install deluge-webui

##Run the Deluge Daemon on startup

Now we've got the components installed we need to make everything run on start-up. So, let's create the first script we need by typing the following command:

> sudo vim /etc/init/deluged.conf

This will create a file called deluged.conf. Next, assuming you're using Putty, highlight the following commands, right-click on them and select Copy

> # deluged - Deluge daemon
> #
> # The daemon component of Deluge BitTorrent client. Deluge UI clients
> # connect to this daemon via DelugeRPC protocol.
>
> description "Deluge daemon"
> author "Deluge Team"
>
> start on filesystem and static-network-up
> stop on runlevel [016]
>
> respawn
> respawn limit 5 30
>
> env uid=deluge
> env gid=deluge
> env umask=000

> exec start-stop-daemon -S -c $uid:$gid -k $umask -x /usr/bin/deluged -- -d

Toggle back to the Putty Session and press the [Insert] key once and add a couple of blank lines by pressing the [Enter] key. Next right click and the lines we've just copied above will be pasted into the file.

Now press the [Esc] key once and type :wq to save and quit out of the script. If you make a mistake editing the file then issue :q! instead of :wq to abort your changes.

##Create the Web start-up script

Now we need to create the script to launch the web user interface:

sudo vim /media/WD40EFRX/RAIDMain/MyScripts/deluge-web.conf

as above, substitute /media/WD40EFRX/RAIDMain/MyScripts with the location of your script files.

This will create a file called deluge-web.conf

Next highlight the following commands, right-click on them and select Copy

# deluge-web - Deluge Web UI
#
# The Web UI component of Deluge BitTorrent client, connects to deluged and
# provides a web application interface for users. Default url: http://localhost:8112

description "Deluge Web UI"
author "Deluge Team"

start on started deluged
stop on stopping deluged

respawn
respawn limit 5 30

env uid=deluge
env gid=deluge
env umask=027

exec start-stop-daemon -S -c $uid:$gid -k $umask -x /usr/bin/deluge-web

Toggle back to the Putty Session and press the [Insert] key once and add a couple of blank lines by pressing the [Enter] key. Next right click and the lines we've just copied above will be pasted into the file.

Now press the [Esc] key once and type :wq to save and quit out of the script. If you make a mistake editing the file then issue :q! instead of :wq to abort your changes.

Now let's copy it to the location required as part of upstart:

sudo cp /media/WD40EFRX/RAIDMain/MyScripts/deluge-web.conf /etc/init/deluge-web.conf

Cross your fingers and restart the server by typing the following command:

sudo reboot -h now
Accessing Deluge via the web interface

You should now be able to access the Web front-end for Deluge by typing http://MyMediaserver:8112 into the address bar of your browser where MyMediaserver is the name you gave to your server when you installed Ubuntu. Alternatively the IP address of the server works just as well.

You should now be presented with the Deluge login-screen. Enter deluge for the password and you should then see a screen similar to this (Note: The version on Trusty looks slightly different to this):

Deluge Web UI
Opening the correct ports on your router

In order to start downloading Torrents you need to open up some ports on your router. If you click on the Preferences icon (the screwdriver/spanner) on the Deluge web interface and select Network, the Incoming Ports (the From: and To: ports inclusively) are the ports you need to open on your router. You can obviously change these ports if so wish, but make sure they match your router settings. Make sure you also uncheck the Use Random Ports option if you're going to be opening a specific port range on your router.
Starting and stopping the deluge daemon:

If at any time you want to stop the deluge daemon then you can do so by issuing the following command:

sudo stop deluged

To start it again use start instead of stop in the above command.
Starting and stopping the web daemon:

If at any time you want to stop the web daemon then use the following command:

sudo stop deluge-web

To start it again use start instead of stop in the above command.
- See more at: http://www.havetheknowhow.com/Install-the-software/Install-Deluge-Headless.html#sthash.cGXrjyqs.dpuf
