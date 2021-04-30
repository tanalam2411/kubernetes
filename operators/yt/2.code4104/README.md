

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
- The Reconcile function returns two objects: a ReconcileResult instance and an
error (if one is encountered). These return values indicate whether or not Kubernetes
should requeue the request. In other words, the Operator tells Kubernetes if the rec‐
oncile loop should execute again. The possible outcomes based on the return values
are:

- `return reconcile.Result{}, nil`: The reconcile process finished with no errors and does not require another pass
  through the reconcile loop.
  
- `return reconcile.Result{}, err`: The reconcile failed due to an error and Kubernetes should requeue it to try again.
  
- `return reconcile.Result{Requeue: true}, nil`: The reconcile did not encounter an error, but Kubernetes should requeue it to
run for another iteration.

- `return reconcile.Result{RequeueAfter: time.Second*5}, nil`: Similar to the previous result, but this will wait for the specified amount of time
before requeuing the request. This approach is useful when there are multiple
steps that must run serially, but may take some time to complete. For example, if
a backend service needs a running database prior to starting, the reconcile can be
requeued with a delay to give the database time to start. Once the database is run‐
ning, the Operator does not requeue the reconcile request, and the rest of the
                steps continue.
                
---

- [Finalizers](https://book.kubebuilder.io/reference/using-finalizers.html) - Finalizers allow controllers to implement asynchronous pre-delete hooks. Let’s say you create an external resource (such as a storage bucket) for each object of your API type, and you want to delete the associated external resource on object’s deletion from Kubernetes, you can use a finalizer to do that.
  - [ref](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/#finalizers)                

- Using [expectations](https://github.com/elastic/cloud-on-K8s/blob/cf5de8b7fd09e55b74389128fbf917897b6bf17a/pkg/controller/common/expectations/expectations.go#L11) for more robust CR object handling (interleaving operations) detection
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