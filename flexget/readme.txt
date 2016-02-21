Flexget:

Run:
sudo -H -u deluge flexget <options>
execute --no-cache
--test execute
check
series list

Delet FlexGet DB (forget all series):
sudo -H -u deluge rm /var/lib/deluge/.flexget/db-config.sqlite

Give plex user access or it cant read the new episode (todo: automate this)
sudo chmod -R 777 /media/TV\ Shows/
