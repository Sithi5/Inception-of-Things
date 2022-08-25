#!/bin/sh

# colors
DARK_GREEN='\e[0;32m'
END='\e[0;m'

echo "${DARK_GREEN}[UNINSTALL] : UBUNTU VERSION...${END}"

sudo kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sudo kubectl delete namespace dev
sudo kubectl delete namespace argocd
sudo k3d cluster delete 

echo "${DARK_GREEN}[UNINSTALL] : COMPLETE! ${END}"
