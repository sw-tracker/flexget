#WD My Cloud

##Mount Password Protected Share on Ubuntu

Solution from: https://wiki.ubuntu.com/MountWindowsSharesPermanently

- To be able to use WD My Cloud with Ubuntu we need the device to have a static IP address. In my case this was easy because my router supports `Address Reservation`:
```
LAN Setup -> Add Address Reservation -> Click on the device -> Reserve IP 192.168.1.XX
```

Then re-boot all devices: PC, router and hard-disk. The new IP address should be there.

- We need to install the file server we will use:
```
sudo apt-get install nfs-common nfs-kernel-server
sudo apt-get install cifs-utils
```

- I was able to mount the nas share from file explorer:

1. Network -> Connect to Server -> Browse

2. it looked like `smb://.../cloud_media/`

3. Enter username and password

- However, this is only temporary. To make it a proper mount first create the folder that will map to the share:
```
sudo mkdir /media/cloud_media/
```

- Then add the mount:
```
sudo vim /etc/fstab
```

Add the following at the end of the file:
```
//192.168.1.XX/cloud_media  /media/cloud_media  cifs  auto,username=<nas_username>,password=<nas_password>,_netdev,iocharset=utf8,sec=ntlm  0  0
```

and run this command to mount:
```
sudo mount -a
```

- This should have already worked. However, lets protect our credentials in a safer location. Create a file in `~/.credentials/.mycloudmedia` with:
```
username=<nas_username>
password=<nas_password>
```

Change the rights:
```
sudo chmod 600 ~/.credentials/.mycloudmedia
```

Modify the line we added before to:
```
//192.168.1.XX/cloud_media  /media/cloud_media  cifs auto,credentials=/home/olga/.credentials/.mycloudmedia,_netdev,iocharset=utf8,sec=ntlm  0  0
```
