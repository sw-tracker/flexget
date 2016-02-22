#Subliminal auto downloads subtitles in different languages.

##Setup:

- Install subliminal (see troubleshoot)
```
sudo apt-get update
sudo apt-get install python-pip (only if flexget is not already installed)
sudo pip install subliminal
sudo pip install --upgrade https://github.com/Diaoul/subliminal/archive/develop.zip
```

- Create a folder for deluge to store subliminal data:
```
sudo -u deluge mkdir /var/lib/deluge/.subliminal
```

- Copy getsubs.sh to the folder above.

- Make it executable:
```
sudo chown deluge:deluge /var/lib/deluge/.subliminal/getsubs.sh
sudo chmod u+x /var/lib/deluge/.subliminal/getsubs.sh
```

- Deluge -> Preferences -> Plugins -> Execute (checkbox ticked)
- Deluge -> Preferences -> Execute -> Add ->
```
Event: 'Torrent Complete'
Command: /var/lib/deluge/.subliminal/getsubs.sh
```

- By default the cache file is stored in your users config folder (~/.config/subliminal.cache.dbm). Since we need to run subliminal as the deluge user copy this file to a folder where deluge has access and then link the 2 files so they are in sync:
```
sudo cp /home/olga/.config/subliminal.cache.dbm /var/lib/deluge/.subliminal/subliminal.cache.dbm
sudo chown deluge:deluge /var/lib/deluge/.subliminal/subliminal.cache.dbm
```

- Make sure your access rights are setup correctly. The deluge user should be able to execute the script successfully.
```
sudo -H -u deluge /var/lib/deluge/.subliminal/getsubs.sh -1 <filename> <filepath>
```

##Usage:
```
subliminal --cache-dir <cachefile> download -l <lang> <filepathandname>
<lang>: en
```

##Troubleshoot:
- Flexget & subliminal dependencies collision
http://discuss.flexget.com/t/solved-flexget-subliminal-dependencies-collision/501

Tested solution:
```
sudo pip install --upgrade https://github.com/Diaoul/subliminal/archive/develop.zip
```
