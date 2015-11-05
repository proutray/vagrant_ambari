#!/usr/bin/env bash

sudo su -
yum upgrade -y
cd /etc/yum.repos.d/

# --------------------- Ambari 2.1.2 -----------------------
wget http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.1.2/ambari.repo
yum install ambari-server -y

ambari-server setup -s
ambari-server start
# --------------------- Ambari 2.1.2 -----------------------

# --------------------- Ambari 2.1.0 -----------------------
# wget http://s3.amazonaws.com/dev.hortonworks.com/ambari/centos7/2.x/BUILDS/2.1.0-1409/ambaribn.repo
# yum install ambari-server -y
# ambari-server setup -s
# ambari-server start
# cp /etc/yum.repos.d/ambaribn.repo /etc/yum.repos.d/ambari.repo
# --------------------- Ambari 2.1.0 -----------------------