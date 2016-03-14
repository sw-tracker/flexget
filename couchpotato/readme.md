#CouchPotato

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
