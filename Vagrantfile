# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

### Global
  # VirtualBox settings
  config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.memory = "512"
  end

  # Disable automatic box update checking
  # config.vm.box_check_update = false

  # Disable default folder mapping
  #config.vm.synced_folder ".", "/vagrant", disabled: true

  # Define number of machines
  N = 1

  # Use (i-1) so above can be intuitive
  (1..N).each do |i|
    config.vm.define "fundev#{i - 1}" do |node|

      ### NETWORK

      node.vm.hostname = "fundev#{i - 1}"
      # Create a private network, which allows host-only access to the machine
      # using a specific IP.
      node.vm.network "private_network", ip: "10.121.121.#{10 + i - 1}"
      #node.vm.network :forwarded_port, guest: 8111, host: 8111


      ### MACHINE
      node.vm.box = "currenthost/funtoo-dev"
      # node.vm.box_version = "14.201116.0"

      ### ACCESS

      # https://www.vagrantup.com/docs/synced-folders/basic_usage

      #config.vm.synced_folder "conf.d", "/vagrant_data"

      # Put your ebuilds etc here
#       node.vm.synced_folder "../src", "/usr/src",
#         owner: "root", group: "root"
      # config.vm.synced_folder ".", "/vagrant", type: "nfs"

      ### SSH
      #node.ssh.username = 'vagrant'
      #node.ssh.password = 'vagrant'
      #node.ssh.insert_key = false
      # Add users public key to guest       https://www.vagrantup.com/docs/vagrantfile/ssh_settings
      #node.ssh.insert_key = true
      #node.ssh.keys_only = false
      #node.ssh.forward_agent = true
      #node.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"
      #node.ssh.compression = false
    end
  end

### PROJECT ENVIRONMENT

  # Ansible provisioning
  #config.vm.provision "ansible" do |ansible|
  #  ansible.verbose = "v"
  #  ansible.inventory_path = ""
  #  ansible.playbook = ""
  #end

end
