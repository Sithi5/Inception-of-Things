# https://www.linkedin.com/pulse/setup-your-personal-kubernetes-cluster-k3s-k3d-suren-raju/

# create cluster with k3d
sudo k3d cluster create -p 8080:80@loadbalancer -p 8888:30888@loadbalancer

# create namespace with kubectl create namespace
sudo kubectl create namespace argocd
sudo kubectl create namespace dev

# install argocd

# check if pods are ready => if not, waiting for it