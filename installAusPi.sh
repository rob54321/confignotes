#!/bin/bash
# this script runs on the raspberry pi and must be run as root
# this script will install all drivers and config files to the raspberrypi
# using the AusPI wireless adapter as a router.
# the edimax wireless adapter should also work if the correct driver is used.

# install extra packages
# apt-get install hostapd isc-dhcp-server

# edit /etc/dhcp/dhcpd.conf
# comment out two lines
sed -i -e 's/^option domain-name/#option domain-name/g' /home/robert/newrpi/etc/dhcp/dhcpd.conf

# uncomment the line with Authorative
sed -i -e 's/^#authoritative/authoritative/' /home/robert/newrpi/etc/dhcp/dhcpd.conf

# add the following lines:
sed -i -e '$a\
subnet 192.168.42.0 netmask 255.255.255.0 {\
range 192.168.42.10 192.168.42.50;\
option broadcast-address 192.168.42.255;\
option routers 192.168.42.1;\
default-lease-time 600;\
max-lease-time 7200;\
option domain-name "local";\
option domain-name-servers 192.168.2.1, 8.8.8.8;\
}' /home/robert/newrpi/etc/dhcp/dhcpd.conf



# edit /etc/default/isc-dhcp-server
sed -i -e '/^INTERFACES=/c\INTERFACES="wlan0"' /home/robert/newrpi/etc/default/isc-dhcp-server

# edit /etc/network/interfaces
sed -i -e '$a\
allow hotplug wlan0\
iface wlan0 inet static\
address 192.168.42.1\
netmask 255.255.255.0' /home/robert/newrpi/etc/network/interfaces

# assign a static ip to wlan0
# ifconfig wlan0 192.168.42.1

# create new file /etc/hostapd/hostapd.conf
echo "" > /home/robert/newrpi/etc/hostapd/hostapd.conf

# add some lines
sed -i -e '$a\
interface=wlan0\
driver=nl80211\
# driver=rtl8192cu for edimax\
ssid=AusiPi_AP\
hw_mode=g\
channel=6\
macaddr_acl=0\
auth_algs=1\
ignore_broadcast_ssid=0\
wpa=2\
wpa_passphrase=0004ed0ea414\
wpa_key_mgmt=WPA-PSK\
wpa_pairwise=TKIP\
rsn_pairwise=CCMP' /home/robert/newrpi/etc/hostapd/hostapd.conf

# edit /etc/default/hostapd
sed -i -e '/#DAEMON_CONF=/c\DAEMON_CONF="/etc/hostapd/hostapd.conf"' /home/robert/newrpi/etc/default/hostapd

# edit /etc/sysctl.conf
sed -i -e '$a\
net.ipv4.ip_forward=1' /home/robert/newrpi/etc/sysctl.conf

# set port fowarding for nat.
# port forwarding is set up by /usr/local/bin/startwlan0 which is launched by 
# /etc/rc.local at boot
# edit /etc/rc.local to launch /usr/local/bin/startwlan0, then exit 0 is last line.
sed -i -e '/^exit 0/i\
/usr/local/bin/startwlan0' /home/robert/newrpi/etc/rc.local

# edit /etc/default/ifplugd
sed -i -e '/^INTERFACES=/c\INTERFACES="eth0"' /home/robert/newrpi/etc/default/ifplugd
