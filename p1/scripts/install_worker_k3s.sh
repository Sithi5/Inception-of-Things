# #!/bin/bash

# https://rancher.com/docs/k3s/latest/en/installation/install-options/agent-config/

DARK_GREEN='\e[0;32m'

END='\e[0;m'

echo "${DARK_GREEN}[TOOLS] : TOKEN MANAGEMENT...${END}"
sudo mkdir -p /root/.ssh
sudo mv /tmp/id_rsa  /root/.ssh
sudo scp -o StrictHostKeyChecking=no root@192.168.42.110:/var/lib/rancher/k3s/server/token /tmp/token
sudo systemctl disable firewalld --now

# https://technique.arscenic.org/transfert-de-donnees-entre/article/scp-transfert-de-fichier-a-travers
# https://linuxhint.com/ssh-stricthostkeychecking/

echo -e "${DARK_GREEN}INSTALL K3S WORKER NODE...${END}"
sudo curl -sfL https://get.k3s.io | sudo sh -s - agent --server "https://192.168.42.110:6443" --token-file "/tmp/token" --flannel-iface=eth1 --node-ip="192.168.42.111"
# on installe k3s sur cette vm mais en mode agent et on le connecte à notre cluster via son adresse et
# on vient checker via le token généré auparavant si la connexion est possible

echo -e "${DARK_GREEN}CHECK SERVICE...${END}" # je ne sais pas pourquoi mais ça ne fonctionne pas pdt le log, je le laisse pour conserver la commande opur check si k3s est bien installé
# k3s check-config

echo "[machine : $(hostname)] has been setup succefully!" # on vient vérifier directement pendant le log si le hostname est correct