#### Machine Auto Healer

##### Overview

- To provide a solution that can observe, detect, resolve node issues and try to keep the node in healthy and running state.

- `Node`: a VM or physical machine, to run k8s workload(pods)
  - A `k8s` cluster can have multiple nodes. [max nodes](https://kubernetes.io/docs/setup/best-practices/cluster-large/)
  - Node has following components:
    - `kubelet` - Agent that runs on each node. Creats `Pods` using `PodSpecs`
    - `Container runtime` - Application that are responsible for running containers(Docker, containerd, podman)
    - `kube-proxy` - network proxy for k8s service  
  
- NodeSpec:
  - [`Unschedulable`](https://github.com/kubernetes/api/blob/master/core/v1/types.go#L4595) - Mark it true to make node unschedulable
  - [`Taints`](https://github.com/kubernetes/api/blob/master/core/v1/types.go#L4598) - Repel node from a set of pods
    - [`Taint based Evictions`](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/#taint-based-evictions): In case a node is 
      to be evicted, the node controller or kubelet adds relevant taints with `NoExecute` effect.
      - If the fault condition returns to normal then the taints can be removed.
      - If there is a chance of fault condition to be recovered, `tolerations` can be added with certain `tolerationSeconds` to avoid pod eviction
      - Note:
        - Kubernetes automatically adds a toleration for `node.kubernetes.io/not-ready` and `node.kubernetes.io/unreachable` with `tolerationSeconds=300`, 
          unless you, or a controller, set those tolerations explicitly.
        - These automatically-added tolerations mean that Pods remain bound to Nodes for 5 minutes after one of these problems is detected.
    - [`Taint Nodes by Condition`](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/#taint-nodes-by-condition) - Scheduler does not
      check for Node [conditions](https://github.com/kubernetes/api/blob/master/core/v1/types.go#L4766); instead the scheduler checks for taints with `NoSchedule` effect.
      - [ref](https://github.com/kubernetes/community/blob/8bdeb0a4d6e7a3fc9afdb874aa2cefa2ba88bc9c/contributors/design-proposals/scheduling/taint-node-by-condition.md)
      - 
        | ConditionType      | Condition Status   |Effect        | Key      |
        | ------------------ | ------------------ | ------------ | -------- |
        |Ready               |True                | -            | |
        |                    |False               | NoExecute    | node.kubernetes.io/not-ready           |
        |                    |Unknown             | NoExecute    | node.kubernetes.io/unreachable         |
        |OutOfDisk           |True                | NoSchedule   | node.kubernetes.io/out-of-disk         |
        |                    |False               | -            | |
        |                    |Unknown             | -            | |
        |MemoryPressure      |True                | NoSchedule   | node.kubernetes.io/memory-pressure     |
        |                    |False               | -            | |
        |                    |Unknown             | -            | |
        |DiskPressure        |True                | NoSchedule   | node.kubernetes.io/disk-pressure       |
        |                    |False               | -            | |
        |                    |Unknown             | -            | |
        |NetworkUnavailable  |True                | NoSchedule   | node.kubernetes.io/network-unavailable |
        |                    |False               | -            | |
        |                    |Unknown             | -            | |
        |PIDPressure         |True                | NoSchedule   | node.kubernetes.io/pid-pressure        |
        |                    |False               | -            | |
        |                    |Unknown             | -            | |


 