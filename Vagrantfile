# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "bento/centos-7.2"

  # sync system-clock
  config.vm.provider :virtualbox do |vb|
    vb.customize ["setextradata", :id, "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled", 0]
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # settings for virtualbox
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    # @see http://docs.mattermost.com/install/requirements.html
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # provision-script
  config.vm.provision :shell do |shell|
    shell.path = "./setup.sh"
    shell.privileged = false
  end

  # synced-folder
  config.vm.synced_folder "./source", "/source",
      owner: "vagrant", group: "vagrant", create: true,
      mount_options: ['dmode=777','fmode=755']

end
