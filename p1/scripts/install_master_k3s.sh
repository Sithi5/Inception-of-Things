#!/bin/bash

DARK_GREEN='\e[0;32m'

END='\e[0;m'

echo "[TOOLS] : install ifconfig tool..."
sudo yum install net-tools -y

echo -e "${DARK_GREEN}INSTALL K3S MASTER NODE...${END}"
curl -sfL https://get.k3s.io | sh -s - --flannel-iface=eth1 --write-kubeconfig-mode 644 --token K10e2363279b55b20748e026d7048d79a52d2aaad024b296fd5b42b9433aa0c9af9::server:2da393e82f06f99f806827f2879e30a9


echo -e "${DARK_GREEN}[PRINT] : DISPLAY K3S STATUS ...${END}"
systemctl status k3s

echo -e "${DARK_GREEN}[PRINT] : DISPLAY K3S MASTER NODE TOKEN...${END}"
sudo cat /var/lib/rancher/k3s/server/node-token