`.........................................................` [***`Table of Contents`***](README.md)


**[Kubernetes Components](https://kubernetes.io/docs/concepts/overview/components/)**

- Kubernetes Cluster
  ![kubernetes cluster](https://d33wubrfki0l68.cloudfront.net/817bfdd83a524fed7342e77a26df18c87266b8f4/3da7c/images/docs/components-of-kubernetes.png)

**Master Components**

- **kube-apiserver**:
  - Exposes k8s API.
  - Is a front end for the k8s control plane.
  - Can run multiple instances of kube-apiserver.
  
- **etcd**:
  - key value store used as k8s backing store for all cluster data.
  
- **kube-scheduler**:
  - Watches newly created pods that have no node assigned, and selects a node for them to run.
  
- **kube-controller-manager**:
  - Logically, each controller is a separate process, but to reduce complexity, they are all compiled into a single binary and run in a single process.
  - [more](../../programming_kubernetes/Introduction/CO_more_about_controllers.md)

- **cloud-controller-manager**
  - Interacts with the underlying cloud providers.
  - [more](intro_cloud_controller_manager.md)
  
**Node Components**

- **kubelet**:
  - Agent that runs on each node in the cluster.
  - Makes sure that containers are running in a pod.
  - Uses PodSpecs to make sure the containers described in the PodSpecs are running and healthy.
  - Doesn't manages containers which are not created by kubernetes.

- **kube-proxy**:
  - A network proxy that runs on each node(implementing a part of Service concept)
  - Uses OS packet filtering layer if there is one, else forwards traffic itself.
  
- **Container Runtime**:
  - Software that is responsible for running the containers(Docker, containerd, cri-o, rktlet)
  
---
**Addons**

- **DNS**:
  - Cluster DNS is a DNS server, addition to other DNS server(s) in your environment, which serves DNS records to k8s services.
  - Containers started by kubernetes automatically include this DNS server in their DNS searches.

- **Web UI (Dashboard)**

- **Container Resource Monitoring** - records generic time-series metrics about containers.

- **Cluster-level Logging** - responsible for saving container logs to a central log store with search/browsing interface.