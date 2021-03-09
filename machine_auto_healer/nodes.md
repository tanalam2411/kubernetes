
##### Nodes

- Components
  - kubelet
  - Container Runtime (CRI)
  
- [ref](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/)  
- `--node-status-update-frequency` - Specifies how often kubelet posts node status to master
- `--node-eviction-rate` - Number of nodes per sec on which pods are deleted in case of ode failure when zone is healthy(in non-multizone, Zone refers to entire cluster)
- `--node-eviction-rate float32`     Default: 0.1
  - Number of nodes per second on which pods are deleted in case of node failure when a zone is healthy 
    (see --unhealthy-zone-threshold for definition of healthy/unhealthy). Zone refers to entire cluster in non-multizone clusters.
- `--unhealthy-zone-threshold` float32     Default: 0.55
  - Fraction of Nodes in a zone which needs to be not Ready (minimum 3) for zone to be treated as unhealthy.
-  `--node-monitor-grace-period duration`     Default: 40s
  - Amount of time which we allow running Node to be unresponsive before marking it unhealthy. 
    Must be N times more than kubelet's nodeStatusUpdateFrequency, where N means number of retries allowed for kubelet to post node status.
- `--node-monitor-period` duration     Default: 5s
  - The period for syncing NodeStatus in NodeController.
- `--node-startup-grace-period` duration     Default: 1m0s
  - Amount of time which we allow starting Node to be unresponsive before marking it unhealthy.
- `--pod-eviction-timeout` duration     Default: 5m0s
  - The grace period for deleting pods on failed nodes.
- `--secondary-node-eviction-rate float32`     Default: 0.01
  - Number of nodes per second on which pods are deleted in case of node failure when a zone is unhealthy 
    (see --unhealthy-zone-threshold for definition of healthy/unhealthy). Zone refers to entire cluster in non-multizone clusters. 
    This value is implicitly overridden to 0 if the cluster size is smaller than --large-cluster-size-threshold.  
    
- Node conditions: https://kubernetes.io/docs/concepts/architecture/nodes/#condition
  - https://github.com/kubernetes/api/blob/master/core/v1/types.go#L4883
  - https://github.com/kubernetes/community/blob/8bdeb0a4d6e7a3fc9afdb874aa2cefa2ba88bc9c/contributors/design-proposals/scheduling/taint-node-by-condition.md
  - Sample Node's condition:
    ```bash
    "conditions": [
        {
            "lastHeartbeatTime": "2021-03-09T09:57:40Z",
            "lastTransitionTime": "2021-03-09T09:11:58Z",
            "message": "kubelet has sufficient memory available",
            "reason": "KubeletHasSufficientMemory",
            "status": "False",
            "type": "MemoryPressure"
        },
        {
            "lastHeartbeatTime": "2021-03-09T09:57:40Z",
            "lastTransitionTime": "2021-03-09T09:11:58Z",
            "message": "kubelet has no disk pressure",
            "reason": "KubeletHasNoDiskPressure",
            "status": "False",
            "type": "DiskPressure"
        },
        {
            "lastHeartbeatTime": "2021-03-09T09:57:40Z",
            "lastTransitionTime": "2021-03-09T09:11:58Z",
            "message": "kubelet has sufficient PID available",
            "reason": "KubeletHasSufficientPID",
            "status": "False",
            "type": "PIDPressure"
        },
        {
            "lastHeartbeatTime": "2021-03-09T09:57:40Z",
            "lastTransitionTime": "2021-03-09T09:12:38Z",
            "message": "kubelet is posting ready status",
            "reason": "KubeletReady",
            "status": "True",
            "type": "Ready"
        }
    ],
    ```

- If the Status of the Ready condition remains `Unknown` or `False` for longer than the `pod-eviction-timeout`, 
  all the Pods on the node are scheduled for deletion by the node controller. 

- The decision to delete the pods cannot be communicated to the kubelet until communication with the API server is re-established. 
  In the meantime, the pods that are scheduled for deletion may continue to run on the partitioned node.



- Marking a node as unschedulable prevents the scheduler from placing new pods onto that Node, 
  but does not affect existing Pods on the Node. 
  `kubectl cordon $NODENAME` 
  - This sets Unschedulable flag to True for that node
    - https://github.com/kubernetes/api/blob/master/core/v1/types.go#L4595
    
    
---
- Scheduler Algorithm - https://github.com/kubernetes/community/blob/8bdeb0a4d6e7a3fc9afdb874aa2cefa2ba88bc9c/contributors/devel/sig-scheduling/scheduler_algorithm.md

