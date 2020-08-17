
- kube-apiserver: Can be scaled horizontally.

- Few controllers list:
  - Node controller
  - Replication controller
  - Endpoints controller

- kubelet: Runs on each node. Makes sure that containers are running in a Pod.
  - Picks PodSpecs and makes sures thoese pods are running.
  - Doesn't manage containers which are not created by kubernetes.
  
- kube-proxy: Maintains network rules on nodes.
  - These network rules allow network communication to your Pods from network sessions inside or outside of your cluster.
  - kube-proxy uses the operating system packet filtering layer if there is one and it's available.
    - Otherwise, kube-proxy forwards the traffic itself.
    