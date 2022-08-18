#### Partie 1 : K3s with Vagrant

- Ce qu'on doit faire :

Dans cette première partie, vous devez mettre en place 2 machines.  

Vous allez rédiger votre premier fichier Vagrantfile avec pour système d’exploitation
la dernière version stable de CentOS. Il est FORTEMENT conseillé d’allouer le strict
minimum en matière de ressources, à savoir : 1 CPU, 512 Mo de RAM (ou 1024). Les
machines doivent être lancées avec Vagrant.
Voici les spécifications attendues :

- Avoir le login d’une personne de votre groupe comme nom de machine. Pour la
première machine, le hostname sera suivi de la lettre majuscule S (comme Server).
Pour la seconde, de SW (comme ServerWorker).
- Avoir une IP dédiée sur l’interface eth1. Pour la première machine (Server), l’IP
sera 192.168.42.110. Pour la seconde (ServerWorker), l’IP sera 192.168.42.111.
- Pouvoir se connecter en SSH sur les deux machines sans mot de passe.

Vous devez installer K3s sur chaque machine et les setup grace a kubectl:
- Dans la première (Server), en mode contrôleur.
- Dans la seconde (ServerWorker), en mode agent


#### Résolution:

dependencies:

```bash
mettre la vm en bridge
sudo apt install openssh-server
sudo service sshd restart
sh script/install_vm.sh

```


On lance le script install_k3s.sh et il va tout faire, fin.
Installer les additionnals guest avant sur la vm quand même.

#### Ressources

- [deploy k3s with ansible](https://www.suse.com/c/rancher_blog/deploying-k3s-with-ansible/)
- [Ingress kubernetes](https://kubernetes.io/fr/docs/concepts/services-networking/ingress/)
- [deploy ingress definition](https://github.com/paulbouwer/hello-kubernetes/blob/6e9ac0e273bfdaf1f9b78501e8b046be00d44eb3/docs/deploy-with-ingress.md#deploy-ingress-definition)
- [deploy kubernetes on server => Image](https://hub.docker.com/r/paulbouwer/hello-kubernetes)
- [package manager for Kubernetes](https://v3.helm.sh/)

- Paul bouwer vraiment bcp de ressources => approfondir
- [commande à intégrer en cas de souci avec yum mirror etc](https://www.cyberithub.com/solved-failed-to-download-metadata-for-repo-appstream/)
- [souci en cas de vbguest](https://stackoverflow.com/questions/43492322/vagrant-was-unable-to-mount-virtualbox-shared-folders)

       <!-- ingress to configure all app
      # EXEMPLE DE LA DOC

      # apiVersion: networking.k8s.io/v1
      # kind: Ingress
      # metadata:
      #   name: simple-fanout-example
      #   annotations:
      #     nginx.ingress.kubernetes.io/rewrite-target: /
      # spec:
      #   rules:
      #   - host: foo.bar.com
      #     http:
      #       paths:
      #       - path: /foo
      #         pathType: Prefix
      #         backend:
      #           service:
      #             name: service1
      #             port:
      #               number: 4200
      #       - path: /bar
      #         pathType: Prefix
      #         backend:
      #           service:
      #             name: service2
      #             port:
      #               number: 8080 -->

      <!-- # EXEMPLE DOC DEFAULTBACKEND

      # apiVersion: networking.k8s.io/v1
      # kind: Ingress
      # metadata:
      #   name: test-ingress
      # spec:
      #   defaultBackend:
      #     service:
      #       name: testsvc
      #       port:
      #         number: 80 -->