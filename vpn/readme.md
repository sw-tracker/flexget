# How to setup a VPN

Install OpenVPN:

````
sudo apt-get install openvpn
````

Create credentials file and change its file permissions so it is only owned by root
````
sudo vim /etc/openvpn/login.txt
sudo chmod 700 /etc/openvpn/login.txt
````

in the file enter (replace with correct values):
````
username
password
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

It will then ask you for your username and password, or you can enter them directly:
````
cd /etc/openvpn
sudo openvpn --config /etc/openvpn/Sweden.ovpn --auth-user-pass /etc/openvpn/login.txt
````
