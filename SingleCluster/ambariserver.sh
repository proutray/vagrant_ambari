#!/usr/bin/env bash

sudo su -
cd /etc/yum.repos.d/

# Different Ambari version's source should be updated here.
wget http://s3.amazonaws.com/dev.hortonworks.com/ambari/centos7/2.x/BUILDS/2.1.0-1409/ambaribn.repo
yum install ambari-server -y

ambari-server setup -s
ambari-server start

# This was a particular error in ambari 2.1's installation. May not be there in other versions. 
cp /etc/yum.repos.d/ambaribn.repo /etc/yum.repos.d/ambari.repo
