# #!/bin/bash

# DARK_GREEN='\e[0;32m'

# END='\e[0;m'

# MASTER_NODE_TOKEN=K10e2363279b55b20748e026d7048d79a52d2aaad024b296fd5b42b9433aa0c9af9::server:2da393e82f06f99f806827f2879e30a9

# echo "[TOOLS] : install ifconfig tool ..."
# sudo yum install net-tools -y

# echo -e "${DARK_GREEN}INSTALL K3S WORKER NODE...${END}"
# curl -sfL https://get.k3s.io | K3S_URL=https://192.168.42.110:6443 K3S_TOKEN=${MASTER_NODE_TOKEN} sh -

# echo -e "${DARK_GREEN}START K3S AGENT...${END}"
# systemctl enable --now k3s-agent



# echo -e "${DARK_GREEN}CHECK SERVICE...${END}"
# systemctl status k3s
