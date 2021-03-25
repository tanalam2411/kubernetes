# Machine Auto Healer


##### Overview: 
  To provide a solution that can observe, detect, resolve node issues and 
  try to keep the node and cluster in a healthy, running state. 
  
---

Terms:

- Conditions: The conditions field describes the status of all Running nodes.
- Taints: 
  - They allow a node to repel a set of pods.  
  - One or more taints are applied to a node; this marks that the node should not accept any pods that do not tolerate the taints.
    


















--- 
- If GKE detects that a node requires repair, the node is drained and recreated.
- GKE waits one hour for the drain to complete.
- If the drain doesn't complete, the node is shut down and a new node is created.

- Support for disabling auto-repair. 
  - If you disable node auto-repair at any time during the repair process, in-process repairs are not cancelled and continue for any node currently under repair.
  
- How we will maintain `Node Repair History`

- Enable node auto-repair:
  - Enable or disable node auto-repair on a per-node basis
  - Enable or disable node auto-repair on node pool basis
  - 



---
Diagrams ref - 
- https://banzaicloud.com/blog/drain/
- https://banzaicloud.com/blog/pipeline-next-gen-integrated-services/
- https://banzaicloud.com/blog/kafka-external-access/
- https://banzaicloud.com/blog/supertubes-ksql/