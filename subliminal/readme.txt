Subliminal auto downloads subtitles in different languages.

Setup:
1. Install subliminal (see troubleshoot)
2. Copy getsubs.sh to a folder
3. Deluge -> Preferences -> Plugins -> Execute (check)
4. Deluge -> Preferences -> Execute -> Add ->
   Event: 'Torrent Complete'
   Command: /<path>/getsubs.sh

Usage:
subliminal download -l <lang> <filepathandname>
<lang>: en

Troubleshoot:
- Flexget & subliminal dependencies collision
http://discuss.flexget.com/t/solved-flexget-subliminal-dependencies-collision/501
Tested solution:
sudo pip install --upgrade https://github.com/Diaoul/subliminal/archive/develop.zip

