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

For running this vagrant VM, you have to install following tools:
* VirtualBox >= 6.0.4
* Vagrant >= 2.2.4

## Getting Started

### Installing the VM


1. Make sure you have a reliable internet connection ;-)
2. On Windows:
    * make sure Hyper-V support is turned off, as explained here: https://ugetfix.com/ask/how-to-disable-hyper-v-in-windows-10/
    * VirtualBox will not work with HyperV turned on
3. Open console in this directory with the downloaded config files
4. Install the VirtualBox Guest Additions plugin for Vagrant with `vagrant plugin install vagrant-vbguest`
5. Start the setup with `vagrant up` (this may take a while - typically around 30 minutes in total - so take a coffee and relax! :-D )
6. Once the installation is done you should see something like: `CLEAN UP DONE`
7. Use `vagrant reload` to start the VM

## Using the VM

* Restarting the virtual machine: `vagrant reload`
* Once installed you can as well start and stop the VM directly from VirtualBox UI (unless you do config changes)

## Authors

VM setup provided by @SimonMueller from here:
https://github.com/SimonMueller/vagrant-dev-env
