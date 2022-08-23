#!/bin/sh

DARK_GREEN='\e[0;32m'

END='\e[0;m'

echo "${DARK_GREEN}[TOOLS] : INSTALL DOCKER...${END}"
# install docker on your machine and make sure daemon are running

echo "${DARK_GREEN}[TOOLS] : INSTALL KUBECTL AND MINIKUBE...${END}"
# https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/
# install kubectl & minikube if needed on your machine and start minikube https://minikube.sigs.k8s.io/docs/start/
# minikube will allow you to run kubectl command line on your machine

echo "${DARK_GREEN}[TOOLS] : INSTALL K3D...${END}"
# install k3d on your machine
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash