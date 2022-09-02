#!/usr/bin/env bash


echo "[K3S] : installing..."
export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san $1 --node-ip $1  --flannel-iface=eth1"
curl -sfL https://get.k3s.io |  sh -

echo "[TOOLS] : install ifconfig tool ..."
sudo yum install net-tools -y

echo "[APP-1] : deploying..."

/usr/local/bin/kubectl  apply -f /home/vagrant/synced_folder/confs/app1/app1.yaml
/usr/local/bin/kubectl  apply -f /home/vagrant/synced_folder/confs/app1/app1.ingress.yaml

echo "[APP-1] : ok..." 


echo "[APP-2] : deploying..."

/usr/local/bin/kubectl  apply -f /home/vagrant/synced_folder/confs/app2/app2.yaml
/usr/local/bin/kubectl  apply -f /home/vagrant/synced_folder/confs/app2/app2.ingress.yaml

echo "[APP-2] : ok..." 

echo "[APP-3] : deploying..."

/usr/local/bin/kubectl  apply -f /home/vagrant/synced_folder/confs/app3/app3.yaml
/usr/local/bin/kubectl  apply -f /home/vagrant/synced_folder/confs/app3/app3.ingress.yaml

echo "[APP-3] : ok..." 