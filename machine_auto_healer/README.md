

- Node Controller: 
  - Monitors hear-beats from the nodes
  - every 10sec kubelet posts back to api-server on the node api object that I'm alive
  - node controller monitors the api-server for node objects and looks when the last keep alive was 
  - if it wsa more thn 5mins, it declares that node as dead and evicts the pod on it
  - So the node controller deletes all the pods that where present on that node
  - Node controller doesn't tell the node(which is dying) to delete the pods, it itself deletes the pod objects
  - Then the replicaset controller will notice that current state doesn't match the desired number of pods, so it will create pod objects
  - But these pods would be unshceduled
  - then the scheduler controller will try to figure out which node satisfies the pod specifications and it will update the pod object with the node details.
  - Then the kubelet on the target node will see a new request for a pod and will make it running
  
- What happens to the node:
 - If the node gets disconnected from network and can't reach the api-server, it will still keep running those pods
   and as soon it connects back to api-server it will notice that these pods object are deleted so it will stop all those existing pods
   
   
   
- Cluster API
  - ManagementCluster vs Bootstrap cluster
  
   
   
---
- Ref
  - https://kubernetes.io/docs/tasks/administer-cluster/safely-drain-node/
  - https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#drain
  - https://kubernetes.io/docs/concepts/workloads/pods/disruptions/
  - https://kubernetes.io/docs/tasks/run-application/configure-pdb/
  - https://banzaicloud.com/blog/drain/
        
- Github
  - https://github.com/openshift/kubernetes-drain
  - https://github.com/openshift/cluster-machine-approver
  - https://github.com/openshift/machine-config-operator
  - https://github.com/openshift/node-problem-detector
  - https://github.com/openshift/node-problem-detector-operator  
  - https://github.com/kubernetes/node-problem-detector
  - https://github.com/openshift/machine-api-operator
  - https://github.com/openshift/api
  - https://github.com/openshift/cluster-api-provider-libvirt
  - https://github.com/openshift/cluster-autoscaler-operator
  

- Blog
  - https://www.airshipit.org/blog/cluster-api-development-environment/
  - https://networkop.co.uk/post/2020-05-cluster-api-intro/
  