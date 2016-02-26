#Install FlexGet on Ubuntu Trusty Tahr 14.04LTS to add RSS functionality to Deluge

Disclaimer: 
These are not my instructions, I copied them from the link below and made a backup of what I did. Thank you very much to the guys at havetheknowhow! http://www.havetheknowhow.com/Install-the-software/Install-FlexGet.html

##Install Python & pip

First off we need to install Python and pip if they're not installed already. So type or paste the following two commands into a Putty session or directly into the command line of your Ubuntu installation:

```
sudo apt-get update

sudo apt-get install python python-pip
```

##Download and install FlexGet

We now want to download and install FlexGet itself. This is a LOT easier than it used to be. Now it's just a single command:

```
sudo pip install flexget
```

To verify the installation worked properly type:

```
flexget -V
```

and it should return the version number. eg. 1.2.201. It will also tell you whether you're on the latest release or not (which we are given we've just installed it!). See NOTE below.

When a new version of FlexGet is released and you want to upgrade to it, simply type the following:

```
sudo pip install --upgrade flexget
```

NOTE: At the time of writing there is a bug in the installation which can be solved by issuing the above command. Once you've run it confirm it's working by issuing flexget -V once more.

##Create the FlexGet working area

Often scripts and applications are run as the default Ubuntu User. However, I run FlexGet using the "deluge" user. The deluge user is the username the Deluge daemon runs under (assuming of course that you've installed Deluge following my guide). If we don't do so then we will hit permission problems since the two parts of the setup (Deluge and FlexGet) will be creating files and folders using different usernames and thus will be using different file/folder permissions.

So we first need to create the working area which FlexGet will use:

```
sudo -u deluge mkdir /var/lib/deluge/.flexget
```

Next we need to add the deluge user as a valid user for the deluge API. So:

```
sudo -u deluge vim /var/lib/deluge/.config/deluge/auth
```

This will open a file called auth which lives in the /var/lib/deluge/.config/deluge folder.

There is already one line in this file but we need to insert an extra line. So press the [Insert] key once (to go into "edit" mode) scroll to the end of the row that's alread there and insert a new blank line. Next type or paste the following string into this new blank line:

```
deluge:deluge:10
```

Now press the [Esc] key once and type the following:

```
:wq
```

This should save your changes and bring you back to the command line. If you make a mistake editing the file then issue :q! instead of :wq to abort your changes.
Running FlexGet in Daemon Mode

In older versions of FlexGet you'd run FlexGet perioidically using a cron job. Now you can simply run it as a Daemon. So, it'll automatically start when the server boots up and check for updated torrents according to the schedule you set in the configuration file. so, let's do that now.

So, let's create the first script we need by typing the following command:

```
sudo vim /etc/init/flexget.conf
```

Next, assuming you're using Putty, highlight the following commands, right-click on them and select Copy

```
#!/bin/bash
# Flexget daemon autostart                                                                                                                                                     

description "Flexget daemon"
author "Kempe"

start on (filesystem and networking) or runlevel [2345]
stop on runlevel [016]

respawn
respawn limit 5 30

env uid=deluge
env gid=deluge

exec start-stop-daemon -S -c $uid:$gid -x /usr/local/bin/flexget -- daemon start
```

Toggle back to the Putty Session and press the [Insert] key once and add a couple of blank lines by pressing the [Enter] key. Next right click and the lines we've just copied above will be pasted into the file.

Now press the [Esc] key once and type :wq to save and quit out of the script. If you make a mistake editing the file then issue :q! instead of :wq to abort your changes.

##Starting and stopping the FlexGet daemon:

If at any time you want to stop the FlexGet daemon then you can do so by issuing the following command:

```
sudo stop flexget
```

To start it again use start instead of stop in the above command.

#Configure FlexGet

Now we have FlexGet installed and configured to run on boot we need to configure it to suit our needs.

##Creating the FlexGet config file on Ubuntu

The configuration file is where we'll store all the instructions for FlexGet. ie. What to download and from where. You can link the config file to a more accessible location. I also setup a separate series file where I list the series I am following.

```
sudo ln -s /home/olga/.flexget/config.yml /var/lib/deluge/.flexget/config.yml
sudo ln -s /home/olga/.flexget/my_series.yml /var/lib/deluge/.flexget/my_series.yml
```

Now type the following command to create/open the file:

```
sudo -u deluge vim /var/lib/deluge/.flexget/config.yml
sudo -u deluge vim /var/lib/deluge/.flexget/my_series.yml
```

Enter the configuration parameters as required. See the FlexGet website for configuration examples.

##Running FlexGet as the "deluge" user

```
cd /
sudo -H -u deluge flexget execute --no-cache
```

##Testing your FlexGet config file

```
sudo -H -u deluge flexget --test execute
```

##Displaying verbose output

```
sudo -H -u deluge flexget execute -v
```

##Checking configuration syntax

```
sudo -H -u deluge flexget check
```

##How to wipe the FlexGet database and start over

FlexGet keeps a record of what files it has and has not downloaded in an SQL database. If you ever want to wipe everything and start over then issue the following command:

```
sudo -u deluge rm /var/lib/deluge/.flexget/db-config.sqlite
```

- See more at: http://www.havetheknowhow.com/Install-the-software/Configure-FlexGet.html#sthash.oMZHY1C8.dpuf
