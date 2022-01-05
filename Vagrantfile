# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    # Default Values
    config.vm.box = "generic/rhel8"
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.provider "virtualbox" do |vm|
      vm.gui = false
      vm.memory = "1024"
      vm.cpus = 1
    end
    config.vm.provider "libvirt" do |vm|
      vm.memory = "1024"
      vm.cpus = 1
    end
  
    config.vm.provision "shell", name: "get_ip", path: "scripts/get-ip-addr.sh"
  
    # Services
    ## DNS Authoritative Server
    config.vm.define "ns1.example.com"  do |server|
        server.vm.box = "generic/alma8"
        server.vm.hostname = "ns1.example.com"
        server.vm.network "private_network", ip: "192.168.56.230"
        server.vm.provision "shell", path: "scripts/fix-sshd.sh"
        server.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/dns-server.yml"
            ansible.playbook_command = "/opt/ansible/bin/ansible-playbook"
            ansible.galaxy_command = "/opt/ansible/bin/ansible-galaxy"
            ansible.compatibility_mode = "2.0"
        end
    end

    ## Single Sign-on Server
    config.vm.define "sso.example.com"  do |server|
        server.vm.hostname = "sso.example.com"
        server.vm.network "private_network", ip: "192.168.56.231"
        server.vm.provision "shell", path: "scripts/fix-sshd.sh"
        server.vm.provider "libvirt" do |vm|
            vm.memory = "4096"
            vm.cpus = 2
        end
        server.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/sso-server.yml"
            ansible.playbook_command = "/opt/ansible/bin/ansible-playbook"
            ansible.galaxy_command = "/opt/ansible/bin/ansible-galaxy"
            ansible.compatibility_mode = "2.0"
            ansible.ask_vault_pass = true
        end
    end
  end