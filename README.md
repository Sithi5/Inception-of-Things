# [Inception-of-Things ( IoT )](https://github.com/Sithi5/Inception-of-Things)

![Alt Text](https://media0.giphy.com/media/RbDKaczqWovIugyJmW/giphy.gif?cid=ecf05e47jeai94q7sisc00k28y5ox70myo9lqzd9crkvweh5&rid=giphy.gif&ct=g)

## Introduction

This project aims to deepen your knowledge by making you use K3d as well
than K3s with Vagrant.

You will learn how to set up a personal virtual machine with Vagrant
and CentOS. Then to use K3s and its Ingress. Finally, you use K3d which
will make life easier.

You will thus have a beginning of experience in the use of Kubernetes.

This project is a basic introduction to Kubernetes. Indeed, this
tool is too complex to grasp in a single topic.

## Objectives

This project consists of having you set up several environments by following
specific rules.

This project is divided into three parts to be done in the order indicated:

• Part 1: K3s with Vagrant  
• Part 2: K3s with three simple applications  
• Part 3: K3d with Argo CD

## Configuration globale et explication

**Configuration de la vm qui contient les autres vm :**

    Installation de ubuntu 20.04
    création de la vm:
        - installer virtualbox
        - appuyer sur new :
        - créer la vm avec linux, ubuntu, 2048 de mémoire vive, 30 GB de stockage sur le
         disque dur virtualbox, effacer le disque, avant de lancer la vm, mettez 4 cpu dans settings setup linux, reboot et taper entrer
        - faire l'update et l'upgrade des packages disponibles
        - installer les packages du fichier requirements.txt
        - lancer la commande : VBoxManage modifyvm vm-name --nested-hw-virt on
        !!! très important, virtualisation obligatoire !!!
    connection ssh a la vm:
        - créer une nouvelle connexion sur virtualbox pour 42 en NAT sinon le proxy bloque la connexion en bridge
        - mettre la première connexion de la vm en bridge connexion sur virtualbox
        - lancer la vm
        - restart le service sshd
        - lancer ifconfig et taper dans terminal ssh user@

 setup depuis ssh:  
```bash
        scp install_docker.sh user@ip:/home/user/  # modifier path 
        sh install_docker.sh   
        sudo ufw disable  
        sudo apt install qemu qemu-kvm libvirt-clients libvirt-daemon-system virtinst bridge-utils  
        sudo systemctl enable libvirtd  
        sudo systemctl start libvirtd  
```   
**k3s :**

    K3s est une distribution Kubernetes légère créée par Rancher Labs,
    et il est entièrement certifié par la Cloud Native Computing Foundation (CNCF).

    k3s est parfait pour Edge
    K3s est une distribution Kubernetes hautement disponible et certifiée conçue pour les charges de travail de production sans surveillance,
    des emplacements distants aux ressources limitées ou à l'intérieur d'appareils IoT.

    K3s est simplifié et sécurisé
    K3s est conditionné sous la forme d'un seul binaire <50 Mo qui réduit les dépendances et les étapes nécessaires à l'installation,
    exécuter et mettre à jour automatiquement un cluster Kubernetes de production

    K3s est optimisé pour ARM
    ARM64 et ARMv7 sont pris en charge avec des fichiers binaires et des images multiarch disponibles pour les deux.
    K3s fonctionne très bien de quelque chose d'aussi petit qu'un Raspberry Pi à un serveur AWS a1.4xlarge 32GiB.

    K3s est setup directement avec kubectl pour pourvoir gérer facilement les clusters.

**cluster :**
    

**Vagrant :**

    Vagrant est un outil permettant de créer et de gérer des environnements de machines virtuelles dans un seul flux de travail.
    Avec un flux de travail facile à utiliser et une concentration sur l'automatisation, Vagrant réduit le temps de configuration de l'environnement de développement,
    augmente la parité de production et fait de l'excuse "fonctionne sur ma machine" une relique du passé.

- [Deployer une vm avec vagrant](https://learn.hashicorp.com/tutorials/vagrant/getting-started-index?in=vagrant/getting-started)

**K3d :**

    K3d est un petit programme (wrapper de k3s) fait pour lancer un cluster k3s dans docker. K3d nous permet de mettre en place tout ce qu'on fera avec vagrant, sans utiliser vagrant
    K3d sera plutôt utilisé dans la 3ème partie avec ArgoCD

- [Introduction k3d](https://www.suse.com/c/rancher_blog/introduction-to-k3d-run-k3s-in-docker/)

**Continuous integration & ArgoCD :**

    L'intégration continue est un ensemble de pratiques utilisées en génie logiciel
    consistant à vérifier à chaque modification de code source que le résultat des modifications
    ne produit pas de régression dans l'application développée.
    Argo CD est un contrôleur Kubernetes, chargé de surveiller en permanence toutes les applications en cours d'exécution et
    de comparer leur état en direct à l'état souhaité spécifié dans le référentiel Git.
    Il identifie les applications déployées avec un état en direct qui s'écarte de l'état souhaité comme OutOfSync.

- [Introduction ArgoCD](https://codefresh.io/learn/argo-cd/#:~:text=Argo%20CD%20is%20a%20Kubernetes%20controller%2C%20responsible%20for%20continuously%20monitoring,the%20desired%20state%20as%20OutOfSync.)

## Resources
- [k3s documentations](https://blog.filador.fr/a-la-decouverte-de-k3s/#:~:text=Fonctionnement&text=Cela%20va%20d%C3%A9marrer%20le%20master,%2Fserver%2Fnode%2Dtoken%20.&text=Et%20votre%20cluster%20K3S%20est%20op%C3%A9rationnel.)
- [ubuntu iso](https://releases.ubuntu.com/20.04/)
- [centos8 iso](https://releases.centos.org/download/)
- [k3d resources](https://k3d.io/v5.4.4/)
- [Vagrant](https://www.vagrantup.com/)
- [use K3s and its Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)
- [kubernetees resources](https://kubernetes.io/)
- [Install Kubernetes Cluster on Ubuntu using K3s](https://computingforgeeks.com/install-kubernetes-on-ubuntu-using-k3s/)

## Authors

- Malo Boucé
- Julien Cammas
- Mathieu Ginisty
