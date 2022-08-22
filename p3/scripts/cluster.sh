# https://www.linkedin.com/pulse/setup-your-personal-kubernetes-cluster-k3s-k3d-suren-raju/
# https://www.sokube.ch/post/gitops-on-a-laptop-with-k3d-and-argocd => ce tuto est incroyable il faut le suivre en parallèle de mes explications ici

# create cluster with k3d
# Let's setup our cluster with 2 worker nodes (--agents in k3d command line) and 
# expose the HTTP load balancer on the host on port 8080 (so that we can interact with our application)
sudo k3d cluster create -p 8080:80@loadbalancer -p 8888:30888@loadbalancer --agents 2

# create namespace with kubectl create namespace
sudo kubectl create namespace argocd
sudo kubectl create namespace dev


# supprimer install.yaml si il y est, il sera réinstallé avec la commande ci-dessous
# install argocd
curl -OL https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# add the --insecure option => cf assets/modif.png (jsp comment on va faire ça en ligne de commande .. à voir si c'est obligatoire ou non)

# Once done, create the argocd namespace and install ArgoCD with the modified script
# run ça sur le namespaces argocd créée en amont avec kubectl

sudo kubectl apply -n argocd -f install.yaml # plus tard mettre à jour le chemin de install.yaml

# check if pods are ready => if not, waiting for it
sudo kubectl wait -n argocd --for=condition=Ready pods --all

# Create an Ingress to redirect /argocd to the argocd main service
# cf ingress.yaml
sudo kubectl apply -f ingress.yaml -n argocd

# Open a browser on
http://localhost:8080/argocd
# Please note that the installation might require some time to complete.

# By default ArgoCD uses the server pod name as the default 
# password for the admin user, so we're gonna replace it with 
# mysupersecretpassword (we used https://bcrypt-generator.com/ to generate the blowfish hash version of "mysupersecretpassword" below)
sudo kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2y$12$Kg4H0rLL/RVrWUVhj6ykeO3Ei/YqbGaqp.jAtzzUSJdYWT6LUh/n6",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'