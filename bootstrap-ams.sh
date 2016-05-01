#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible
apt-get -y install tree
apt-get -y install python-passlib

# copy examples into /home/vagrant (from inside the mgmt node)
cp -a /vagrant/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant
mv /etc/ansible/hosts /etc/ansible/hosts.orig
cp /vagrant/hosts /etc/ansible/hosts

# setup /etc/ansible/ansible.cfg

cat > /etc/ansible/ansible.cfg <<EOL

[defaults]

forks          = 10
remote_port    = 22

EOL


# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes

192.168.34.10  ams
192.168.34.21  OpenStack01
192.168.34.22  OpenStack02
192.168.34.23  OpenStack03
192.168.34.24  OpenStack04
192.168.34.31  keystone01
192.168.34.51  ampq01
192.168.34.61  maria01
192.168.34.62  maria02

EOL

ssh-keyscan $(cat names) > /home/vagrant/.ssh/known_hosts
chown vagrant:vagrant /home/vagrant/.ssh/known_hosts
