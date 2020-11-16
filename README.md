# Vagrant Developer Environment

This development environment is targeted for use in courses about Java Software Development 
and therefore contains most important tools typically needed in such a setup.

## Tools Included

* Git
* nvm
* nano
* oh-my-zsh
* Open JDK
* Python 3
* Maven
* Docker
* docker-compose
* Atom Text Editor
* Firefox
* IntelliJ Ultimate

## Prerequisites

To run this Vagrant VM, you have to install the following tools:
* VirtualBox >= 6.1.14
* Vagrant >= 2.2.10

## Getting Started

### Installing the VM

1. Make sure you have a reliable internet connection :wink:
2. Only on Windows:
    * Make sure Hyper-V support is turned off (VirtualBox will not work with HyperV turned on)
3. Open a console in the directory with the cloned or downloaded config files (where the `Vagrantfile` is)
4. Install the VirtualBox Guest Additions plugin for Vagrant with `vagrant plugin install vagrant-vbguest`
5. Start the setup with `vagrant up` (this may take a while - typically around 30 minutes in total - so take a coffee and relax! :coffee: )
6. Once the installation is done you should see something like: `CLEANUP DONE`
7. Use `vagrant reload` to bring the virtual machine up in graphical mode

### Using the VM

1. Start the VM with `vagrant up`
2. The default user is `vagrant` with the password `vagrant`

**Note**: Once installed you can as well start and stop the VM directly from VirtualBox UI (unless you do config changes in your Vagrantfile)

### Configure the VM

To increase performance :rocket:
* In VirtualBox UI you may configure that the VM gets more memory or cpu: Stop the VM first and then change it under `Change/System` on the VM.

## Known Issues / Troubleshooting

* In case you have troubles that automatic maximising of screen size to the host screen size does not work and the option `automatic adoption of guest screen size` is disabled in virtual box menu `Display`, then do the following:
    * run the command `vagrant vbguest --do install` while the VM is running
    * after restart the vm again with `vagrant reload`
    * when logged in, you should be able to maximize the screen to your screen
    * check that the option `Automatic adoption to guest screen size` is enabled and selected in virtual box menu `Display`.
* When 3D acceleration is enabled the use of Chromium is discouraged as it can crash the Virtual Machine.
* In Virtual Box 6.0.6 the configured shared folder might currently not work as expected.
* If the download mirror for the base box returns a 404 status: try using a different URL by using the property `config.vm.box_url` - go to the problematic url to find out the real URL and set it (instead of property `config.vm.box_version`)

## Background Information

### Why is VirtualBox used and not VMWare?

Vagrant supports only VirtualBox for free, if you want to use it with VMWare you have to pay.

**Note**: For a commercial project it might be a good idea to pay and use VMware together with Vagrant instead, because the integration with VMware should be more performant and has better support by Vagrant.

### Authors

VM setup provided by [@SimonMueller](https://github.com/SimonMueller)
