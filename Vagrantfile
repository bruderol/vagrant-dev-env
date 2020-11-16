Vagrant.require_version ">= 2.2.4"

Vagrant.configure("2") do |config|
  config.vm.box = "fedora/32-cloud-base"
  config.vm.box_version = "32.20200422.0"
  config.vm.provider "virtualbox" do |v|
  	v.memory = 6000
  	v.cpus = 2
    v.gui = true
  	v.name = "Developer Environment"
    v.customize ["modifyvm", :id, "--vram", "128"]
    v.customize ["modifyvm", :id, "--accelerate3d", "on"]
    v.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
    v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end
  config.vm.provision "file", source: ".zshrc", destination: "/home/vagrant/.zshrc-custom"
  config.vm.provision :shell, path: "provision.sh", privileged: false
  config.vm.synced_folder "shared/", "/home/vagrant/shared"
end
