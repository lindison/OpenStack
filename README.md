This creates the base OpenStack virtual machines (in Vagrant and Virtualbox)

This was written on an Ubuntu 15.10 64bit Server Dell Workstation T5500

This builds everything with three interface cards
a NAT network
a Internal network (192.168.34.0/24)
a Public network (using enp6s0) 

enp6s0 is important and is used in the Vagrantfile, this will need to be udpated to match your network description.

