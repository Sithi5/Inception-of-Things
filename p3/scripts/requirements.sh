#!/bin/sh

DARK_GREEN='\e[0;32m'

END='\e[0;m'
echo "${DARK_GREEN}[TOOLS] : UBUNTU VERSION...${END}"


echo "${DARK_GREEN}[TOOLS] : INSTALL DOCKER...${END}"
# install docker on your machine and make sure daemon are running
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

sudo apt install docker-ce -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ${USER}
newgrp docker

echo "${DARK_GREEN}[TOOLS] : INSTALL KUBECTL AND MINIKUBE...${END}"
# https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/
# install kubectl & minikube if needed on your machine and start minikube https://minikube.sigs.k8s.io/docs/start/
# minikube will allow you to run kubectl command line on your machine
sudo apt install kubectl

echo "${DARK_GREEN}[TOOLS] : INSTALL K3D...${END}"
# install k3d on your machine
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash