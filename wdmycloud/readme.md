#WD My Cloud

- To be able to use WD My Cloud with Ubuntu we need the device to have a static IP address. In my case this was easy because my router supports `Address Reservation`:
```
LAN Setup -> Add Address Reservation -> Click on the device -> Reserve IP 192.168.1.XX
```

Then re-boot all devices: PC, router and hard-disk. The new IP address should be there.

- We need to install the file server we will use:
```
sudo apt-get install nfs-common nfs-kernel-server
```

- Enable SSH on WD My Cloud: `My Cloud Dashboard -> Settings -> Network -> SSH`
```
ssh root@192.168.1.XX
```
```
The authenticity of host 'nas (xxx.xxx.xxx.xxx)' can't be established.RSA key fingerprint is 12:34:56:78:90:AB:CD:EF:00:11:22:33:44:55:66:77.
Are you sure you want to continue connecting (yes/no)?
```
Enter `yes`.
```
Warning: Permanently added 'nas,xxx.xxx.xxx.xxx' (RSA) to the list of known hosts.
```
Type your root password, or if you haven't ever changed it, type `welc0me`. If you are logged on using the default password CHANGE IT NOW by typing:
```
passwd
```

- We now need to modify the file responsible for managing the exports on the server/pc. (Create a backup, make it read-only, 
```
cd /etc/
sudo cp exports exports.orig
sudo chmod 400 exports.orig
sudo vim exports
```

Add the following line:
```
/wdmycloud/ourmedia *(rw,no_all_squash,sync,no_subtree_check,insecure,crossmnt,anonuid=65534,anongid=1000)
```

Then copy the file to the hard disk:
```
rcp exports root@192.168.1.XX:/etc/
```

Now we need to restart the NFS server to make the changes take effect:
```
sudo /etc/init.d/nfs-kernel-server restart
```

Check that it was mount correctly
```
showmount -e localhost
```

Check user ID on server/pc and ssh/hard disk:
```
id -u ourmedia
result: 1003 (ssh)
```



- Now we need to mount the hard disk on Ubuntu (`/home/wdmycloud/`):
```
sudo mkdir wdmycloud
```
