#!/bin/bash
# this script installs 32 bit google earth for 64 bit systems.
# dpkg is used for the install since apt-get install will
# fail as the ia32-libs dependency will not be met.

apt-get install libfontconfig1:i386 \
	libx11-6:i386 \
	libxrender1:i386 \
	libxext6:i386 \
	libgl1-mesa-glx:i386 \
	libglu1-mesa:i386 \
	libglib2.0-0:i386 \
	libsm6:i386
cd /mnt/hdext/backups/linux/googleearth
# wget http://dl.google.com/dl/earth/client/current/google-earth-stable_current_i386.deb
dpkg -i google-earth-stable_current_i386.deb
apt-get install -f
