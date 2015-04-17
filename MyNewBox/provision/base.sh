#!/bin/sh

boxName=$1

#remove yum cache
yum clean all

#update sources
yum check-update

#Install packages here
yum install -y httpd

#Start services at boot
/sbin/chkconfig httpd on

#Copy the config files
cp -rf /vagrant/"$boxName"/conf/* /
