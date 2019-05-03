# Vagrant Developer VM

## Tools included

* Git
* nvm
* Atom Text Editor
* IntelliJ Ultimate
* Maven
* Gradle
* Open JDK
* oh-my-zsh
* Firefox
* nano
* Python 3
* Docker
* docker-compose

## Prerequisites

For running this vagrant VM, you have to install following tools:
* VirtualBox >= 6.0.4
* Vagrant >= 2.2.4

## Getting Started

### Installing the VM

1. Simply open a command line terminal in the directory where you checked out this repository with the configuration files.
2. Make sure you have a reliable internet connection ;-)
3. Install the VirtualBox Guest Additions plugin for Vagrant with `vagrant plugin install vagrant-vbguest`
4. Start the initial setup with `vagrant up` (this may take a while)

## Using the VM

* Restarting the virtual machine: `vagrant reload`
* Once installed you can as well start and stop the VM directly from VirtualBox UI (unless you do config changes)

## Authors

VM setup provided by @SimonMueller from here:
https://github.com/SimonMueller/vagrant-dev-env
