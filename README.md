# Vagrant Developer Environment

## Tools Included

* Git
* nvm
* nano
* oh-my-zsh
* Open JDK
* Python 3
* Maven
* Gradle
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

## Known issues

* When 3D acceleration is enabled the use of Chromium is discouraged as it can crash the Virtual Machine
* In VirtualBox 6.0.6 the configured shared folder might currently not work as expected.
 
**Note**: For a commercial project it might be a good idea to pay and use VMware together with Vagrant instead, because the integration with VMware should be more performant and has better support by Vagrant.

## Authors

VM setup provided by [@SimonMueller](https://github.com/SimonMueller)
