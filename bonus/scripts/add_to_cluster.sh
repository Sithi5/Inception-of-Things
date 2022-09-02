
# colors
DARK_GREEN='\e[0;32m'
END='\e[0;m'

echo "${DARK_GREEN}[UPDATE CLUSTER] : ADD NAMESPACE...${END}"

# on va créer le namespace gitlab sur notre cluster (créer en p3) afin d'y relier notre répo gitlab

sudo kubectl create namespace gitlab

echo "${DARK_GREEN}[UPDATE CLUSTER] : Apply modifications to argocd...${END}"

# de la même manière que dans la p3, on ajoute à argoCD notre répo gitlab via ces commandes

sudo kubectl apply -n argocd -f ../confs/application.yaml
sudo kubectl apply -n argocd -f ../confs/project.yaml
