

- An Operator is an application-specific controller that extends the kubernetes API to create, configure, and manage instances of(complex) applications on behalf of a kubernetes user.

- operator = Custom Resource Definition + Custom Controller

- The Control Loop
  - Event -> Observe -> Analyze -> Act
  
- One Controller per object(looking one root object)

- K8s comes with several features to make the life of a (controller) developer easier
  - Scheduling and Supervision(self-healing)
  - Configuration and Secret Management
  - Service Discovery and Networking
  - Storage Management
  - (Cloud) Potability
  - Declarative API Stability and Extensibility (CRDs)
  - AuthN and AuthZ (RBAC)
  - SDKs
  
---

##### Required Mindset

- Autonomous Process
  - Single Responsible Principle
  - Decoupling via event-driven messaging 
  - No central coordinator
  
- Concurrency & Asynchrony
  - Eventual consistent by design
  - Don't rely on(assume) order
  
- Stateless over Stateful
  - API server(etcd) is the source of truth
  - In-memory cache via reconciliation 
  
- Defensive programming
  - Things will go wrong(crash)
  - No, shared(wall) clock
  - Anticipate effects on the rest of the system    
  
- Side Effects
  - Delivery and processing guarantees only within K8s
  
---
- [codeconnect-vm-operator](https://github.com/embano1/codeconnect-vm-operator)
- [Markers](https://book.kubebuilder.io/reference/markers.html#markers-for-configcode-generation) - Markers are single-line comments that start with a plus, followed by a marker name, optionally followed by some marker specific configuration:
  ```go                                                                                                                                                                                                        
  // +kubebuilder:validation:Optional
  // +kubebuilder:validation:MaxItems=2
  // +kubebuilder:printcolumn:JSONPath=".status.replicas",name=Replicas,type=string
  ```

- [operator](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/)
- kubernetes [objects](https://kubernetes.io/docs/concepts/overview/working-with-objects/) 











--- 

##### Cmds

```nashorn js
# run operator locally
$ make manager && bin/manager -insecure

```


---

- Ref
- https://github.com/brito-rafa/k8s-webhooks
- https://github.com/brito-rafa/k8s-mutators