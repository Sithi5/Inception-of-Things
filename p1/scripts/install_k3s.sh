# #!/bin/bash
# noir='\e[0;30m'
# gris='\e[1;30m'
# rougefonce='\e[0;31m'
# rose='\e[1;31m'
# vertfonce='\e[0;32m'
# vertclair='\e[1;32m'
# orange='\e[0;33m'
# jaune='\e[1;33m'
# bleufonce='\e[0;34m'
# bleuclair='\e[1;34m'
# violetfonce='\e[0;35m'
# violetclair='\e[1;35m'
# cyanfonce='\e[0;36m'
# cyanclair='\e[1;36m'
# grisclair='\e[0;37m'
# blanc='\e[1;37m'
# neutre='\e[0;m'

# echo -e "${vertfonce}DOWNLOADING K3S...${neutre}"
# sudo wget https://github.com/k3s-io/k3s/releases/download/v1.23.5%2Bk3s1/k3s

# echo -e "${vertfonce}Setting up server and worker server vms...${neutre}"

# vagrant up

# sudo sh -c 'echo "192.168.42.110  mabouceS\n192.168.42.111  maginistSW\n" >> /etc/hosts'

# echo -e "${vertfonce}Setting up k3s...${neutre}"

# sudo chmod +x k3s
# sudo ./k3s server

# echo -e "${vertfonce}Checking nodes..${neutre}"

# sudo ./k3s kubectl get nodes
