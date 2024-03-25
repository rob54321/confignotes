#!/usr/bin/perl -w
# this perl script runs on the raspberry pi and must be run as root
# this perl script will install all drivers and config files to the raspberrypi
# using the AusPI wireless adapter as a router.
# the edimax wireless adapter should also work if the correct driver is used.

# install extra packages
@installpackages = ("apt-get", "install", "hostapd", "isc-dhcp-server");
system(@installpackages) == 0
    or die "system @installpackages failed: $?";
    

