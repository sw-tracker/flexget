# How to setup a VPN

Install OpenVPN:

````
sudo apt-get install openvpn
````

## Use Private Internet Access

https://www.privateinternetaccess.com/

````
sudo apt-get install openvpn
cd /etc/openvpn
sudo wget https://www.privateinternetaccess.com/openvpn/openvpn.zip
sudo unzip openvpn.zip
ls -l
sudo openvpn 'config-filename-goes-here.ovpn'
````
