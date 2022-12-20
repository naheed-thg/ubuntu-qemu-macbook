# ubuntu-qemu-macbook
Scripts for running a linux vm on an M1 macbook

Dependencies:
* On your macbook:  ```$ brew install qemu telnet```
* Download an ISO installer image for Ubuntu Server for Arm here:  https://ubuntu.com/download/server/arm - get the LTS version 22.04.1

Getting started:
* Verify that you can find the ubuntu installer image `ubuntu-22.04.1-live-server-arm64.iso`
* Verify that when you installed qemu you got a firmware image called `edk2-aarch64-code.fd`.  The default homebrew location will be `/opt/homebrew/share/qemu/edk2-aarch64-code.fd`

Creating a QCOW image:
* You need to create an empty virtual disk image on which to install ubuntu.  I recommend creating a 20G qcow-format image like this:  `$ qemu-img create -f qcow2 ubuntu.qcow2 20G`

Now we can edit `install.sh` to reflect the locations of these 3 files.  After that, we can run `install.sh`.  In another terminal, `telnet localhost 4444` and follow the instructions.

...

(to do: Installation advice here)

...

Nice to have once you're up and running:
* SSH keys - copy your `~/.ssh/id_rsa.pub` file to your new vm `scp -P20022 id_rsa.pub  username@localhost:~/` 
* Append id_rsa.pub to `~/.ssh/authorized_keys` 
* permissions matter on this file, they should be read and write for owner only (`-rw-------`)

* Edit `~/.ssh/config` on your macbook and add an entry like this:
```
Host ubuntu
     User username
     HostName 127.0.0.1
     Port 20022
```
     
* sudo without password - edit `/etc/sudoers` and add a line like: `myusername ALL=(ALL) NOPASSWD: ALL`
* Update with `sudo apt update` and `sudo apt upgrade`
* Install stuff with `sudo apt install ...`

 
