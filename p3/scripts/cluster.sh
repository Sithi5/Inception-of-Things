# https://www.linkedin.com/pulse/setup-your-personal-kubernetes-cluster-k3s-k3d-suren-raju/
# https://www.sokube.ch/post/gitops-on-a-laptop-with-k3d-and-argocd => ce tuto est incroyable il faut le suivre en parallèle de mes explications ici


# colors
DARK_GREEN='\e[0;32m'
END='\e[0;m'

echo "${DARK_GREEN}[TOOLS] : CREATE CLUSTER WITH K3D...${END}"
# create cluster with k3d
# Let's setup our cluster with 2 worker nodes (--agents in k3d command line) and 
# expose the HTTP load balancer on the host on port 8080 (so that we can interact with our application)
sudo k3d cluster create -p 8080:80@loadbalancer -p 8888:30888@loadbalancer --agents 2


echo "${DARK_GREEN}[TOOLS] : CREATE NAMESPACES ARGOCD & DEV WITH KUBECTL...${END}"
# create namespace with kubectl create namespace
sudo kubectl create namespace argocd
sudo kubectl create namespace dev


echo "${DARK_GREEN}[TOOLS] : DELETE INSTALL.YAML...${END}"
# supprimer install.yaml si il y est, il sera réinstallé avec la commande ci-dessous
# kubectl delete -f install.yaml

echo "${DARK_GREEN}[TOOLS] : INSTALL ARGOCD...${END}"
# install argocd
# curl -OL https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# add the - --insecure options => cf assets/modif.png (jsp comment on va faire ça en ligne de commande .. à voir si c'est obligatoire ou non) ligne 10185, search ARGOCD_SERVER_INSECURE

# Once done, create the argocd namespace and install ArgoCD with the modified script
# run ça sur le namespaces argocd créée en amont avec kubectl

echo "${DARK_GREEN}[TOOLS] : APLLY INSTALL.YAML (ARGOCD FILE CONFIGURATION)...${END}"
sudo kubectl apply -n argocd -f ../confs/install.yaml # plus tard mettre à jour le chemin de install.yaml

echo "${DARK_GREEN}[TOOLS] : WAIT FOR PODS TO CONTINUE...${END}"
# check if pods are ready => if not, waiting for it
# sudo kubectl wait -n argocd --for=condition=Ready pods --all

echo "${DARK_GREEN}[TOOLS] : INSTALL INGRESS...${END}"
# Create an Ingress to redirect /argocd to the argocd main service
# cf ingress.yaml
sudo kubectl apply -f ../confs/ingress.yaml -n argocd

# Open a browser on
# http://localhost:8080/argocd
# Please note that the installation might require some time to complete.

echo "${DARK_GREEN}[TOOLS] : CHANGE DEFAULT PASSWORD...${END}"
# By default ArgoCD uses the server pod name as the default 
# password for the admin user, so we're gonna replace it with 
# mysupersecretpassword (we used https://bcrypt-generator.com/ to generate the blowfish hash version of "mysupersecretpassword" below)
sudo kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2y$12$Kg4H0rLL/RVrWUVhj6ykeO3Ei/YqbGaqp.jAtzzUSJdYWT6LUh/n6",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'

echo "${DARK_GREEN}[TOOLS] : APPLY PROJECT...${END}"
sudo kubectl apply -f ../confs/project.yaml -n argocd

echo "${DARK_GREEN}[TOOLS] : APPLY APP...${END}"
sudo kubectl apply -f ../confs/application.yaml -n argocd
