#UltraStar Deluxe

##Installation on Ubuntu 14.04

Execute the following commands on a terminal:
```
sudo add-apt-repository ppa:tobydox/ultrastardx
sudo apt-get update
sudo apt-get install ultrastar-deluxe
```

You will get this message:
```
=== IMPORTANT NOTE ===
It has been reported that video playback is broken with the ffmpeg/libav packages provided by Ubuntu. After installing the updated packages from https://launchpad.net/~jon-severinsson/+archive/ffmpeg everything works fine.
 More info: https://launchpad.net/~tobydox/+archive/ubuntu/ultrastardx
Press [ENTER] to continue or ctrl-c to cancel adding it
```

Press ENTER to continue.

However, if sound doesnt work with videos you will need to install ffmpeg:
```
sudo add-apt-repository ppa:mc3man/trusty-media
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install ffmpeg
```

instructions found at: http://www.faqforge.com/linux/how-to-install-ffmpeg-on-ubuntu-14-04/

##Config location

On Ubuntu the config file is located:
```
~/.ultrastardx/config.ini
```

Add the folder location of your songs in the `[Directories]` section:
```
[Directories]
SongDir1=/media/local/UltraStar/
SongDir2=/media/cloud_media/UltraStar/
```
