
#!/bin/bash
vertfonce='\e[0;32m'
neutre='\e[0;m'

echo "${vertfonce}[INFO]:\tThis script has been created for easy install for a host in virtualbox.${neutre}"


echo "${vertfonce}[INFO]:\tUpdate of linux...${neutre}"
sudo apt update
sudo apt upgrade
echo "${vertfonce}[OK]:\tUpdate done!\n ${neutre}"

echo "${vertfonce}[INFO]:\tInstall docker...\n${neutre}"
sudo apt install docker
echo "${vertfonce}[OK]\tDocker done!\n ${neutre}"

echo "${vertfonce}[INFO]:\tInstall depedencies...\n ${neutre}"
sudo apt install build-essential dkms linux-headers-$(uname -r)
sudo apt install vagrant
sudo apt install virtualbox
vagrant plugin install vagrant-vbguest
sudo ufw disable
sudo apt install qemu qemu-kvm libvirt-clients libvirt-daemon-system virtinst bridge-utils
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo chmod 666 /var/run/libvirt/libvirt-sock
ssh-keygen -t rsa

echo "${vertfonce}[INSTALLATION]:\t COMPLETE! ${neutre}"
