#!/usr/bin/env bash

sudo su -
yum install ntp -y
service ntpd start

cp /home/vagrant/sync/hosts /etc/hosts
cp /home/vagrant/sync/resolv.conf /etc/resolv.conf

systemctl stop firewalld

mkdir -p /root/.ssh; chmod 700 /root/.ssh
cp /home/vagrant/sync/id_rsa /root/.ssh
cp /home/vagrant/sync/id_rsa.pub /root/.ssh
touch /root/.ssh/authorized_keys; chmod 640 /root/.ssh/authorized_keys
cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

echo "if test -f /sys/kernel/mm/redhat_transparent_hugepage/defrag; then echo never > /sys/kernel/mm/redhat_transparent_hugepage/defrag fi" >> /etc/rc.local

#/etc/init.d/iptables stop

# Increasing swap space
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1024k
sudo mkswap /swapfile
sudo swapon /swapfile
echo "/swapfile       none    swap    sw      0       0" >> /etc/fstab

yum install wget -y
#sudo yum upgrade -y
