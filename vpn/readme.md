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

You should get:
````
Wed May 4 08:42:37 2016 OpenVPN 2.3.4 arm-unknown-linux-gnueabihf [SSL (OpenSSL)] [LZO] [EPOLL] [PKCS11] [MH] [IPv6] built on Jan 23 2016
Wed May 4 08:42:37 2016 library versions: OpenSSL 1.0.1k 8 Jan 2015, LZO 2.08
Wed May 4 08:42:37 2016 UDPv4 link local: [undef]
Wed May 4 08:42:37 2016 UDPv4 link remote: [AF_INET]185.3.135.34:1194
Wed May 4 08:42:37 2016 WARNING: this configuration may cache passwords in memory -- use the auth-nocache option to prevent this
Wed May 4 08:42:37 2016 [Private Internet Access] Peer Connection Initiated with [AF_INET]185.3.135.34:1194
Wed May 4 08:42:40 2016 TUN/TAP device tun0 opened
Wed May 4 08:42:40 2016 do_ifconfig, tt->ipv6=0, tt->did_ifconfig_ipv6_setup=0
Wed May 4 08:42:40 2016 /sbin/ip link set dev tun0 up mtu 1500
Wed May 4 08:42:40 2016 /sbin/ip addr add dev tun0 local 10.177.1.6 peer 10.177.1.5
Wed May 4 08:42:40 2016 Initialization Sequence Completed
````

# Verify VPN

Open a new terminal and type:
````
sudo wget http://ipinfo.io/ip -qO -
````

You should get the same IP address as return during the openvpn command output line:
````
Wed May 4 08:42:37 2016 UDPv4 link remote: [AF_INET]185.3.135.34:1194
````

