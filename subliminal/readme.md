#Subliminal auto downloads subtitles in different languages.

##Setup:
- Install subliminal (see troubleshoot)
```
sudo apt-get update
sudo apt-get install python-pip (only if flexget is not already installed)
sudo pip install subliminal
sudo pip install --upgrade https://github.com/Diaoul/subliminal/archive/develop.zip
```
- Copy getsubs.sh to a folder where user deluge has rights
- Made it executable:
```
sudo chmod u+x /home/deluge/getsubs.sh
```
- Deluge -> Preferences -> Plugins -> Execute (checkbox ticked)
- Deluge -> Preferences -> Execute -> Add ->
  Event: 'Torrent Complete'
  Command: /<path>/getsubs.sh
- By default the cache file is stored in your users config folder (~/.config/subliminal.cache.dbm). Since we need to run subliminal as the deluge user copy this file to a folder where deluge has access and then link the 2 files so they are in sync:
```
sudo ln -s ~/.config/subliminal.cache.dbm /home/deluge/.config/subliminal.cache.dbm
```
- Make sure your access rights are setup correctly. The deluge user should be able to execute the script successfully.
```
sudo -u deluge /home/deluge/getsubs.sh -1 <filename> <filepath>
```

##Usage:
```
subliminal download -l <lang> <filepathandname> -a <cachefile>
<lang>: en
```

##Troubleshoot:
- Flexget & subliminal dependencies collision
http://discuss.flexget.com/t/solved-flexget-subliminal-dependencies-collision/501

Tested solution:
```
sudo pip install --upgrade https://github.com/Diaoul/subliminal/archive/develop.zip
```
