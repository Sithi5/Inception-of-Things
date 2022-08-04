#!/usr/bin/env bash


echo "[K3S] : installing..."
export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san $1 --node-ip $1 --flannel-iface=eth1"
curl -sfL https://get.k3s.io |  sh -



echo "[TOOLS] : install ifconfig tool ..."
sudo yum install net-tools -y

echo "[APP-1] : deploying..."

/usr/local/bin/kubectl create configmap app1-html --from-file /Users/julien/42/IoT/p2/jcammasS/confs/app1/index.html
/usr/local/bin/kubectl  apply -f /Users/julien/42/IoT/p2/jcammasS/confs/app1/app1.deployment.yaml
/usr/local/bin/kubectl  apply -f /Users/julien/42/IoT/p2/jcammasS/confs/app1/app1.service.yaml
/usr/local/bin/kubectl  apply -f /Users/julien/42/IoT/p2/jcammasS/confs/app1/app1.ingress.yaml

echo "[APP-1] : ok..." 