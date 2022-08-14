#### Partie 3 : K3d avec Argo CD

- Ce qu'on doit faire :

  Vous maîtrisez maintenant parfaitement K3s dans sa version minimaliste ! Vous allez
  pouvoir mettre en place tout ce que vous venez de voir (et bien plus !) cette fois sans
  Vagrant. Pour cela, installez K3d sur votre machine virtuelle.

  Une fois votre configuration fonctionnelle, vous allez set up votre première intégration continue !
  cf assets/schema.png afin de visualiser la demande

  Vous devrez créer deux namespaces :

  • Le premier pour la mise en place du logiciel Argo CD.
  • Le second, qui sera appelé dev, pour contenir une application. Celle-ci sera automatiquement déployée avec Argo CD en utilisant votre dépôt Github en ligne.

- Méthode :

  - Créer un script d'installation afin d'avoir toutes les ressources nécessaires
  - Créer un cluster
  - Utiliser des fichier yaml (ansible) pour créer les différentes applications associées

#### Ressources

- [app deploy with argo cd and k3d](https://yashguptaa.medium.com/application-deploy-to-kubernetes-with-argo-cd-and-k3d-8e29cf4f83ee)
- [same](https://www.sokube.ch/post/gitops-on-a-laptop-with-k3d-and-argocd) => suivre ce tuto là
