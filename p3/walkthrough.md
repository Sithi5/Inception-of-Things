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

#### Correction p3

- Part 3 --- Configuration :

  2 namespaces in k3d cluster : argocd & dev => kubectl get ns => ok

  Verify that there is at least 1 pod in the "dev" ns => kubectl get pods -n dev => pas encore fait la partie sur dev

  difference between a namespace and a pod => https://enterprisersproject.com/article/2020/9/pod-cluster-container-what-is-difference#:~:text=%E2%80%9CA%20container%20runs%20logically%20in,tight%20logical%20borders%20called%20namespaces.%E2%80%9D

  A container runs logically in a pod (though it also uses a container runtime); A group of pods, related or unrelated, run on a cluster. A pod is a unit of replication on a cluster; A cluster can contain many pods, related or unrelated [and] grouped under the tight logical borders called namespaces

  check that all the required services are running => docker / kubectl / k3d / minikube ? / argoCD

  check that Argo CD is installed and configured => y accéder via http://localhost:8080/argocd

#### Ressources

- [install kubectl mac os](https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/)
- [minikube link if needed](https://minikube.sigs.k8s.io/docs/start/)
- [k3d & k3s cluster](https://www.linkedin.com/pulse/setup-your-personal-kubernetes-cluster-k3s-k3d-suren-raju/)
- [app deploy with argo cd and k3d](https://yashguptaa.medium.com/application-deploy-to-kubernetes-with-argo-cd-and-k3d-8e29cf4f83ee)
- [same](https://www.sokube.ch/post/gitops-on-a-laptop-with-k3d-and-argocd) => suivre ce tuto là
