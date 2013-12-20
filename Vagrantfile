# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.box = "precise64"
  
  config.vm.provision :shell, :path => "provisioning/bootstrap.sh"

  config.vm.provision :puppet do |puppet|
          puppet.manifests_path = "provisioning/manifests"
          puppet.module_path    = "provisioning/manifests/modules"
          puppet.manifest_file  = "default.pp"
          puppet.options = [
                  # '--verbose',
                  # '--debug',
          ]
  end

  config.vm.provider :virtualbox do |vb|
    # vb.gui = true
    
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 4445, host: 4444

end
