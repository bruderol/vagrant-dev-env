# Vagrant Developer Environment

This development environment is targeted for use in courses about Java Software Development 
and therefore contains all tools typically needed in such a setup.

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
* VirtualBox >= 6.0.4
* Vagrant >= 2.2.4

## Getting Started

### Installing the VM


1. Make sure you have a reliable internet connection :wink:
2. Only on Windows (users of a real OS can jump to next step :wink: ):
    * Make sure Hyper-V support is turned off (VirtualBox will not work with HyperV turned on)
      * see here for how to do this: https://www.poweronplatforms.com/enable-disable-hyper-v-windows-10-8/
3. Open console in this directory with the downloaded config files (where the `Vagrantfile` is)
4. Install the VirtualBox Guest Additions plugin for Vagrant with `vagrant plugin install vagrant-vbguest`
5. Start the setup with `vagrant up` (this may take a while - typically around 30 minutes in total - so take a coffee and relax! :coffee: )
6. Once the installation is done you should see something like: `CLEANUP DONE`
7. Use `vagrant reload` to bring the virtual machine up in graphical mode

### Using the VM

1. Start the VM with `vagrant up`
2. The default user is "__vagrant__" with the password "__vagrant__"

**Note**: Once installed you can as well start and stop the VM directly from VirtualBox UI (unless you do config changes in your Vagrantfile)

### Configure the VM

To increase performance :rocket:
* you can configure in VirtualBox UI that the VM gets more memory or cpu. For this you have to stop the VM first. Then you can go to VirtualBox UI and change it on the VM under `...`.

## Known Issues

* When 3D acceleration is enabled the use of Chromium is discouraged as it can crash the Virtual Machine.
* In Virtual Box 6.0.6 the configured shared folder might currently not work as expected.

## Background Information

### Why is VirtualBox used and not VMWare?

Vagrant supports only VirtualBox for free, if you want to use it with VMWare you have to pay.

For a commercial project it might be a good idea to pay and use VMWare instead, because, the integration with VMWare should be more performant. 

### Authors

VM setup provided by [@SimonMueller](https://github.com/SimonMueller)
