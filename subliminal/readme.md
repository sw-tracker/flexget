#Subliminal auto downloads subtitles in different languages.

##Setup:
1. Install subliminal (see troubleshoot)
```
sudo apt-get update
sudo apt-get install python-pip (only if flexget is not already installed)
sudo pip install subliminal
sudo pip install --upgrade https://github.com/Diaoul/subliminal/archive/develop.zip
```
2. Copy getsubs.sh to a folder
3. Made it executable:
```
sudo chmod u+x /home/server/getsubs.sh
```
4. Deluge -> Preferences -> Plugins -> Execute (checkbox ticked)
5. Deluge -> Preferences -> Execute -> Add ->
   Event: 'Torrent Complete'
   Command: /<path>/getsubs.sh
6. Make sure your access rights are setup correctly. The deluge user should be able to execute the script successfully.
```
sudo -u deluge /<path>/getsubs.sh -1 <filename> <filepath>
```

##Usage:
```
subliminal download -l <lang> <filepathandname>
<lang>: en
```

##Troubleshoot:
- Flexget & subliminal dependencies collision
http://discuss.flexget.com/t/solved-flexget-subliminal-dependencies-collision/501

Tested solution:
```
sudo pip install --upgrade https://github.com/Diaoul/subliminal/archive/develop.zip
```
