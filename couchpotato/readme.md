#CouchPotato

##CouchPotato Server

http://localhost:5050

##Install on Ubuntu 14.04

From: http://dominicm.com/install-couchpotato-ubuntu-14-04/

Create a system user account that CouchPotato will run under.
```
sudo useradd -r -s /bin/false -m couchpotato
```

Add the system user to the primary group, in my case `deluge`.
```
sudo usermod -g deluge couchpotato
```

Update, install python and clone the latest release of CouchPotato from the official git repository in `/opt/CouchPotatoServer`.
```
sudo apt-get update
sudo apt-get install git-core python
cd /opt
sudo git clone https://github.com/RuudBurger/CouchPotatoServer.git
```

Set the ownership to the user and group CouchPotato will run as and set permissions to grant full access to CouchPotato user.
```
sudo chown -R couchpotato:deluge /opt/CouchPotatoServer
sudo chmod -R 755 /opt/CouchPotatoServer
```

Run CouchPotato manually as `couchpotato` user so it creates the required folders for that user.
```
sudo -H -u couchpotato python /opt/CouchPotatoServer/CouchPotato.py
```

##Run CouchPotato at StartUp

Open or create a new upstart configuration file for CouchPotato.
```
sudo vim /etc/init/couchpotato.conf
```

Copy the script and save the configuration file.
```
description "CouchPotato upstart script"
author "DominicM @ dominicm.com"
# What user to run as
setuid couchpotato
# What group to run as
setgid deluge
# When to start the service [Graphical multi-user plus networking (DEFAULT)]
start on runlevel [2345]
# When to stop the service
stop on runlevel [016]
# Automatically restart process if crashed
respawn
respawn limit 5 30
# Start the process
script
exec python /opt/CouchPotatoServer/CouchPotato.py
end script
```

Run CouchPotato with upstart.
```
start couchpotato
```
