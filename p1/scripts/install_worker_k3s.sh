#!/bin/bash

DARK_GREEN='\e[0;32m'

END='\e[0;m'

echo -e "${DARK_GREEN}INSTALL K3S MASTER NODE...${END}"
curl -sfL https://get.k3s.io/ | sh -s -worker --flannel-iface=eth1 --write-kubeconfig-mode 644

echo "[TOOLS] : install ifconfig tool ..."
sudo yum install net-tools -y


echo -e "${DARK_GREEN}CHECK SERVICE...${END}"
systemctl status k3s