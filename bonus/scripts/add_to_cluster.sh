
# colors
DARK_GREEN='\e[0;32m'
END='\e[0;m'

echo "${DARK_GREEN}[UPDATE CLUSTER] : ADD NAMESPACE...${END}"


sudo cluster create namespace gitlab

echo "${DARK_GREEN}[UPDATE CLUSTER] : Apply modifications to argocd...${END}"

kubectl apply -n argocd -f /confs/application.yaml
kubectl apply -n argocd -f /confs/project.yaml
