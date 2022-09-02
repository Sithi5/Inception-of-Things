# #!/bin/bash

DARK_GREEN='\e[0;32m'

END='\e[0;m'

# https://k3s.io/

echo "${DARK_GREEN}[TOOLS] : TOKEN MANAGEMENT...${END}"
sudo mkdir -p /root/.ssh
sudo cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys
sudo systemctl disable firewalld --now
# on vient créer un espace dans lequel on va pouvoir générer un token => token récupérer et copier via la commande scp et
# une connexion ssh par la suite dans le script de l'agent

echo -e "${DARK_GREEN}INSTALL K3S MASTER NODE...${END}"
curl -sfL https://get.k3s.io | sudo sh -s - server --write-kubeconfig-mode 644 --flannel-iface=eth1 --node-ip="192.168.42.111"
# on installe k3s sur cette vm mais en mode server pour permettre à un potentiel agent de s'y connecter

echo -e "${DARK_GREEN}[PRINT] : DISPLAY K3S STATUS ...${END}" # je ne sais pas pourquoi mais ça ne fonctionne pas pdt le log, je le laisse pour conserver la commande opur check si k3s est bien installé
# k3s check-config

echo "[machine : $(hostname)] has been setup succefully!" # on vient vérifier directement pendant le log si le hostname est correct