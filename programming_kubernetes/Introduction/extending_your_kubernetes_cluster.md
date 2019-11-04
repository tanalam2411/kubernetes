`......................................................... GoTo` [***`Introduction`***](README.md)


**[Extending your Kubernetes Cluster](https://kubernetes.io/docs/concepts/extend-kubernetes/extend-cluster/)**

- Cluster Operator - A person who configures, controls, and monitors cluster.
  - Cluster operators are different from the [`Operator Pattern`](https://coreos.com/operators/) that extends Kubernetes API.

- Platform developer - A person who customizes the Kubernetes platform to fit the needs of their project.
  - [Custom Resources](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/)
  - [Contributors](https://kubernetes.io/docs/reference/glossary/?all=true#term-contributor) - PRs, issues, feedback, [`special interest group`](https://github.com/kubernetes/community/blob/master/sig-list.md#master-sig-list) participation, or organizing community events.
  - [Extend the Kubernetes API with aggragation layer](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/apiserver-aggregation/)
    - An  APIService will be implemented by an `extension-apiserver` in a pod running in the cluster, and could be paired with one or more controllers. eg. [`service-catalog`](https://github.com/kubernetes-sigs/service-catalog/blob/master/README.md)
    
**Extension Patterns**
  - Controller(Controller pattern) - is a client of kubernetes. It typically read an object's `.spec`, possibly do things, and then update the object's `.status`.
  - Weebhook - When k8 is the client and calls out to a remote service, called `Webhook`. The remote service is called a `Weebhook Backend`. Like Controllers, Webhooks do add point of failure.
  - Binary [plugins](https://kubernetes.io/docs/tasks/extend-kubectl/kubectl-plugins/) - k8 executes binary program. (e.g. [`Flex Volume Plugins`](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-storage/flexvolume.md), [`Network Plugins`](https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/)
  
  
  ![extensions ](https://docs.google.com/drawings/d/e/2PACX-1vQBRWyXLVUlQPlp7BvxvV9S1mxyXSM6rAc_cbLANvKlu6kCCf-kGTporTMIeG5GZtUdxXz1xowN7RmL/pub?w=960&h=720)
 
 
- Operator pattern - Combination of a custom resource API and a control loop. It is used to manage specific, usually stateful, applications. 
- Custom APIs and control loops(controllers) can also be used to control other resources, such as storage or policies.
- Newly added custom resources always fall in a new API Groups. 
  - We cannot change or replace existing API groups.
  - Adding an API doesn't directly let you affect the behaviour of existing APIs(e.g. Pods), but `API Access Extentions` do.
  
  