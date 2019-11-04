`......................................................... GoTo` [***`Index`***](../README.md)

**Introduction**

- Kubernetes cloud cluster provider
  - Amazon EKS
  - Microsoft AKS
  - Google GKE
  - Openshift
  
- Local way to have k8 cluster
  - [kind](https://kind.sigs.k8s.io/)
  - [k3d](https://github.com/rancher/k3d)
  - [Docker Desktop](https://www.docker.com/products/docker-desktop)
  

- Example containing client-go, kubebuilder, operator example - [`https://github.com/programming-kubernetes/cnat`](https://github.com/programming-kubernetes/cnat)

- [Extend kubectl with plugins](https://kubernetes.io/docs/tasks/extend-kubectl/kubectl-plugins/)
  - [krew](https://github.com/kubernetes-sigs/krew) - Package manager for kubectl plugins.
  - [cli-runtime](https://github.com/kubernetes/cli-runtime ) - Set of helpers for creating kubectl commands and plugins. 
  - [sample-cli-plugin](https://github.com/kubernetes/sample-cli-plugin) - Sample kubectl plugin.
  
- [Extension Patterns](https://kubernetes.io/docs/concepts/extend-kubernetes/extend-cluster/) - [Extending your Kubernetes Cluster](extending_your_kubernetes_cluster.md):
  - [Configuration files and flags](https://kubernetes.io/docs/reference/#config-reference)
  - [Cloud Providers](https://github.com/kubernetes?utf8=%E2%9C%93&q=cloud-provider&type=&language=)
    - [Developing Cloud Controller Manager
](https://kubernetes.io/docs/tasks/administer-cluster/developing-cloud-controller-manager/)
    - [Device Plugins](https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/device-plugins/) - vendor specific device plugin
    - [CRI](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-node/container-runtime-interface.md) - Container Runtime Interface
    - [Dynamic Admission Control Webhook](https://kubernetes.io/docs/reference/access-authn-authz/extensible-admission-controllers/#what-are-admission-webhooks)
    - [Custom Resource](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/)
    - [Custom API Servers]()
    - [Scheduler extensions](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/scheduling/scheduler_extender.md) - Extending scheduler
    - [Authentication webhook](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#webhook-token-authentication)
    
______________________________________________________________________________________
**Controllers and Operators**     
- [Introduction](CO_Introduction.md)