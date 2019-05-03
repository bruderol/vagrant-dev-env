Vagrant.require_version ">= 2.2.4"

Vagrant.configure("2") do |config|
  config.vm.box = "fedora/29-cloud-base"
  config.vm.box_version = "29.20181024.1"
  config.vm.provider "virtualbox" do |v|
  	v.memory = 12000
  	v.cpus = 2
    v.gui = true
  	v.name = "Developer Environment"
    v.customize ["modifyvm", :id, "--vram", "128"]
    v.customize ["modifyvm", :id, "--accelerate3d", "on"]
    v.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
    v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end
   config.vm.provision :shell, path: "provision.sh", privileged: false
   config.vm.synced_folder "share/", "/home/vagrant/share"
end
