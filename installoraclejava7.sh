#!/bin/bash

#To install oracle java
add-apt-repository ppa:webupd8team/java
apt-get update

apt-get install oracle-java7-installer
update-java-alternatives -s java-7-oracle
apt-get install oracle-java7-set-default

# to remove java
#apt-get remove oracle-java7-installer
