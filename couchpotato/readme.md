#CouchPotato

##Install on Ubuntu 14.04

From: http://dominicm.com/install-couchpotato-ubuntu-14-04/

```
sudo useradd -r -s /bin/false -m couchpotato
sudo usermod -g deluge couchpotato
sudo apt-get update
sudo apt-get install git-core python
cd /opt
sudo git clone https://github.com/RuudBurger/CouchPotatoServer.git
sudo chown -R couchpotato:deluge /opt/CouchPotatoServer
sudo chmod -R 755 /opt/CouchPotatoServer
sudo -H -u couchpotato python /opt/CouchPotatoServer/CouchPotato.py
```
