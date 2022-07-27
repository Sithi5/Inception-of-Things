#### Partie 2 : K3s avec trois applications simples

- Ce qu'on doit faire :

  Vous allez mettre en place 3 applications web de votre choix qui tourneront dans votre
  instance K3s. Il faudra pouvoir accéder à celles-ci en fonction de l’HOST choisi en faisant
  une requête vers l’adresse IP 192.168.42.110. Le nom de cette machine sera encore une
  fois un de vos logins suivi de S (par exemple wilS si votre login est wil).

  Lorsqu’un client entre l’IP 192.168.42.110 dans son navigateur web avec l’HOST
  app1.com, le serveur doit afficher l’app1. S’il utilise l’HOST app2.com, le serveur doit afficher l’app2. Sinon, l’app3 sera choisie par défaut.

  cf assets/schema.pgn afin de visualiser la demande

- Méthode :

  - Créer une VM avec k3s en mode serveur comme dans la P1
  - Utiliser des fichier yaml (ansible) pour créer les différentes applications associées

#### Ressources

- [deploy k3s with ansible](https://www.suse.com/c/rancher_blog/deploying-k3s-with-ansible/)
- [Ingress kubernetes](https://kubernetes.io/fr/docs/concepts/services-networking/ingress/)
- [deploy ingress definition](https://github.com/paulbouwer/hello-kubernetes/blob/6e9ac0e273bfdaf1f9b78501e8b046be00d44eb3/docs/deploy-with-ingress.md#deploy-ingress-definition)
- [deploy kubernetes on server => Image](https://hub.docker.com/r/paulbouwer/hello-kubernetes)
- [package manager for Kubernetes](https://v3.helm.sh/)

- Paul bouwer vraiment bcp de ressources => approfondir
- [commande à intégrer en cas de souci avec yum mirror etc](https://www.cyberithub.com/solved-failed-to-download-metadata-for-repo-appstream/)
- [souci en cas de vbguest](https://stackoverflow.com/questions/43492322/vagrant-was-unable-to-mount-virtualbox-shared-folders)
