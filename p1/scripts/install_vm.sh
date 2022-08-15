
#!/bin/bash
noir='\e[0;30m'
gris='\e[1;30m'
rougefonce='\e[0;31m'
rose='\e[1;31m'
vertfonce='\e[0;32m'
vertclair='\e[1;32m'
orange='\e[0;33m'
jaune='\e[1;33m'
bleufonce='\e[0;34m'
bleuclair='\e[1;34m'
violetfonce='\e[0;35m'
violetclair='\e[1;35m'
cyanfonce='\e[0;36m'
cyanclair='\e[1;36m'
grisclair='\e[0;37m'
blanc='\e[1;37m'
neutre='\e[0;m'

echo -e "${vertfonce}This script has been created for easy install for a host in virtualbox.${neutre}"


echo -e "${vertfonce}Update of linux...${neutre}"
sudo apt update
sudo apt upgrade
echo -e "${vertfonce}Update done!\n ${neutre}"

echo -e "${vertfonce}Install docker...\n${neutre}"
sudo apt install docker
echo -e "${vertfonce}Docker done!\n ${neutre}"

echo -e "${vertfonce}Install depedencies...\n ${neutre}"
sudo apt install ../../requirements.txt
sudo apt install build-essential dkms linux-headers-$(uname -r)
sudo apt install vagrant
vagrant plugin install vagrant-vbguest
sudo ufw disable
sudo apt install qemu qemu-kvm libvirt-clients libvirt-daemon-system virtinst bridge-utils
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo chmod 666 /var/run/libvirt/libvirt-sock

echo -e "${vertfonce}Run Vagrantfile${neutre}"

vagrant up