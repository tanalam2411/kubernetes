`.........................................................` [***`Table of Contents`***](README.md)


- `Desired State`: The state of cluster you want it to be. What applications or other workloads you want to run, the number of replicas, what network and disk resources you want to make available etc.
- `Kubernetes Control Plane`:  Makes the clusters current state match the desired state via Pod Lifecycle Event Generator([PLEG](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/node/pod-lifecycle-event-generator.md))

![k8_control_plane.png](static/k8_control_plane.png)

- `k8s Master` (single node) - `kube-api server`, `kube-controller-manager` and `kube-scheduler`.
- `k8s non-master` node - `kubelet` (communicates with master), `kube-proxy` (manages network proxy on each node).

**Basic Kubernetes objects**:
- Pod
- Service
- Volume
- Namespace

`Other higher level abstraction that rely on controllers:`
- Deployment
- DaemonSet
- StatefulSet
- ReplicaSet
- Job

**Kubernetes** provides:
- Service discovery and load balancing 
  - exposes container using DNS name or using their own IP address.
  - can load balance and distribute the network traffic so that the deployment is stable.
- Storage orchestration
  - can automatically mount a storage system such as local storages, public cloud providers, etc.
- Automated rollouts and rollbacks
- Automatic bin packing
  - Manages your nodes and can fit containers on nodes to make best use of your resources.
- Self-healing
- Secret and configuration management
  - You can store and manage sensitive information, such as passwords, OAuth tokens, and ssh keys.
    You can deploy and update secrets and application configuration without rebuilding your container images, 
    and without exposing secrets in your stack configuration.

-----

[Open Service Broker](https://github.com/openservicebrokerapi/servicebroker) - Service brokers manage the lifecycle of services, and platforms interact with service brokers to provision, get access to and manage the services they offer. The Open Service Broker API defines these interactions, and therefore allows software providers to offer their services to anyone, regardless of the technology or infrastructure those software providers wish to utilise.


