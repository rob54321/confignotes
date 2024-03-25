#!/bin/bash
#How to install Oracle Java 8
#Type commands as root:

add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java8-installer

update-java-alternatives -s java-8-oracle
apt-get install oracle-java8-set-default

