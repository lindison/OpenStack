# Define the Vagrant environment for Ansible 101
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Create some OpenStack Servers
  (1..4).each do |i|
    config.vm.define "OpenStack0#{i}" do |openstack|
        openstack.vm.box ="ubuntu/wily64"
        openstack.vm.hostname = "OpenStack0#{i}"
        openstack.vm.network :private_network, ip: "192.168.34.2#{i}"
        openstack.vm.network "public_network", bridge: "enp6s0"
        openstack.vm.network "forwarded_port", guest: 80, host: "1022#{i}"
        openstack.vm.network "forwarded_port", guest: 443, host: "1023#{i}"
        openstack.vm.network "forwarded_port", guest: 8888, host: "1024#{i}"
        openstack.vm.provider "virtualbox" do |vb|
          vb.memory = "2048"
        end
    end
  end

  # Create some services servers
  (1..1).each do |i|
    config.vm.define "keystone0#{i}" do |keystone|
        keystone.vm.box="ubuntu/wily64"
        keystone.vm.hostname = "keystone0#{i}"
        keystone.vm.network :private_network, ip: "192.168.34.3#{i}"
        keystone.vm.network "public_network", bridge: "enp6s0"
        keystone.vm.network "forwarded_port", guest: 80, host: "1032#{i}"
        keystone.vm.network "forwarded_port", guest: 443, host: "1033#{i}"
        keystone.vm.network "forwarded_port", guest: 8888, host: "1034#{i}"
        keystone.vm.provider "virtualbox" do |vb|
          vb.memory = "512"
        end
    end
  end

# Create an AMPQ server
  (1..1).each do |i|
    config.vm.define "ampq0#{i}" do |ampq|
        ampq.vm.box="ubuntu/wily64"
        ampq.vm.hostname = "ampq0#{i}"
        ampq.vm.network :private_network, ip: "192.168.34.5#{i}"
        ampq.vm.network "forwarded_port", guest: 80, host: "1056#{i}"
        ampq.vm.network "forwarded_port", guest: 8080, host: "1057#{i}"
        ampq.vm.provider "virtualbox" do |vb|
          vb.memory = "512"
        end
    end
  end

  # Create some MariaDB servers
  (1..2).each do |i|
    config.vm.define "maria0#{i}" do |maria|
        maria.vm.box="ubuntu/wily64"
        maria.vm.hostname = "maria0#{i}"
        maria.vm.network :private_network, ip: "192.168.34.6#{i}"
        maria.vm.network "public_network", bridge: "enp6s0"
        maria.vm.network "forwarded_port", guest: 80, host: "1067#{i}"
        maria.vm.provider "virtualbox" do |vb|
          vb.memory = "2048"
        end
    end

  # Create the Ansible Management Server
  config.vm.define :ams do |ams|
    ams.vm.box = "ubuntu/wily64"
    ams.vm.hostname = "ansible01"
    ams.vm.network "private_network", ip: "192.168.34.10"
    ams.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
    ams.vm.provision :shell, path: "bootstrap-ams.sh"
  end

  end
end
