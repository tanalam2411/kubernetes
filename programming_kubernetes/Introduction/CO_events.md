`......................................................... GoTo` [***`Introduction`***](README.md)


**Events**

- Controllers watch changes to kubernetes objects in the API server: add, updates, and removes. 
  When such an event happens, the controller executes its business logic.


Let's see what happens under the hood when we run [this](yamls/nginx-deployment.yaml) deployment using `kubectl` cmd.

```bash
$ cat yamls/nginx-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:1.7.9
          ports:
            - containerPort: 80

$ kubectl apply -f yamls/nginx-deployment.yaml 
deployment.apps/nginx-deployment created

$ kubectl get pods -n default
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-5754944d6c-qskp6   1/1     Running   0          49s

```

1. The `deployment` controller (inside of `kube-controller-manager`) notices (through a deployment `informer`) that the user creates a deployment. It creates a replica set in its business logic.

2. The `replica set` controller (again inside of `kube-controller-manager`) notices (through a replica set `informer`) the new replica set and subsequently runs its business logic, which creates a pod object.

3. The `scheduler` (inside the `kube-scheduler` binary) - which is also a controller, notices the pod(through a pod `informer`) with an empty `spec.nodeName` field. Its business logic puts the pod in its scheduling queue.

4. Meanwhile the `kubelet`(also a controller) notices the new pod (through `pod` informer). But the new pod's `spec.nodeName` field is empty and therefore does not match the kubelet's node name. It ignores the pod and goes back to sleep(until next event).

5. The scheduler takes the pod out of the work queue and schedules it to a node that has enough free resources by updating the `spec.nodeName` field in the pod and writing it to the API server.

6. The kubelet wakes up again due to the pod update event. It again compares the `spec.nodeName` with its own node name. The name matches, and so the kubelet starts the containers of the pods and reports back that the containers have been started by writing this information into the pod status, back to the API server.

7. The `replica set` controller notices the changed pod but has nothing to do.

8. Eventually the pod terminates. The kubelet will notice this, get the pod object from the API server and set the `terminated` condition in the pod' status, and write it back to the API server.

9. The replica set controller notices the terminated pod and decides that this pod must be replaced. It deletes the terminated pod on the API server and creates a new one.

10. And so on.


These events are sent from API server to the  `informers` inside the controllers via [`watches`](https://github.com/kubernetes/apimachinery/tree/master/pkg/watch), that is streaming connections of watch events.

_______________________________________________________________________________

**Watch EVENTS versus the EVENT object** 

- `Watch events` and the top-vele `Event` object in kubernetes are two different things:
  - `Watch events` are sent through HTTP connections between the API server and controllers to drive informers.
  - The top-level `Event` object is a resource like pods, deployments, services, with the special property that it has a `time-to-live` of an hour and then is purged automatically from `etcd`.
  
  - listing all events within `default` namespace.
  
  ```bash
  $ kubectl get events -n default -o wide
  ```
    ```bash
    LAST SEEN   TYPE     REASON              OBJECT                                   SUBOBJECT                SOURCE                        MESSAGE                                                                                 FIRST SEEN   COUNT   NAME
    102m        Normal   Killing             pod/nginx-deployment-5754944d6c-qskp6    spec.containers{nginx}   kubelet, kind-control-plane   Stopping container nginx                                                                102m         1       nginx-deployment-5754944d6c-qskp6.15d485b7e7814f9b
    101m        Normal   Scheduled           pod/nginx-deployment-5754944d6c-xjsdt                             default-scheduler             Successfully assigned default/nginx-deployment-5754944d6c-xjsdt to kind-control-plane   101m         1       nginx-deployment-5754944d6c-xjsdt.15d485c83fc83bfa
    101m        Normal   Pulled              pod/nginx-deployment-5754944d6c-xjsdt    spec.containers{nginx}   kubelet, kind-control-plane   Container image "nginx:1.7.9" already present on machine                                101m         1       nginx-deployment-5754944d6c-xjsdt.15d485c88ae70d10
    101m        Normal   Created             pod/nginx-deployment-5754944d6c-xjsdt    spec.containers{nginx}   kubelet, kind-control-plane   Created container nginx                                                                 101m         1       nginx-deployment-5754944d6c-xjsdt.15d485c90c3b9ae5
    101m        Normal   Started             pod/nginx-deployment-5754944d6c-xjsdt    spec.containers{nginx}   kubelet, kind-control-plane   Started container nginx                                                                 101m         1       nginx-deployment-5754944d6c-xjsdt.15d485c91ba54002
    101m        Normal   SuccessfulCreate    replicaset/nginx-deployment-5754944d6c                            replicaset-controller         Created pod: nginx-deployment-5754944d6c-xjsdt                                          101m         1       nginx-deployment-5754944d6c.15d485c838b5d6a2
    101m        Normal   ScalingReplicaSet   deployment/nginx-deployment                                       deployment-controller         Scaled up replica set nginx-deployment-5754944d6c to 1                                  101m         1       nginx-deployment.15d485c837619e42
    
    ```  

_____________________________________________________________________________________

**[Events - The DNA of Kubernetes](https://www.mgasch.com/post/k8sevents/)**

> "Autonomous process reacting to events from the API server"

- The processes(`Controller or Control loop`) only communicates with API server, i.e. never directly to each other.
- An Event is   is simply an immutable fact that happened, e.g. "pod created". Also referred as `event-driven architecture` where the flow between the individual components(microservices) is a choreography without a central orchestrator.

______________________________________________________________________________________

**[How Kubernetes Works](https://www.mgasch.com/post/k8sevents/)**

- Think of API server as a broker with multiple immutable(replicated) logs (or queues), representing a stream of events.
- Events are facts that can be causally related(happened before) or not related at all(happened concurrently).
- `etcd` is important for the durability of events.

- All processes(controllers), e.g. the scheduler, deployment controller, endpoint controller, kublet, etc. can be understood as producers and/or consumers of events from these logs.
- Consumers specify the objects(and optionally namespace) they want to receive events from the API server. This is called a ***`ListWatch`*** in k8s.
- **[ListWatch](https://godoc.org/k8s.io/client-go/tools/cache#ListWatch)** - list all events from the API server when consumers starts, then switch to ***`watch mode`***(triggered by new events) to reduce the load on the API server.

- Think of the combination of object_namespace as a dedicated(virtual) event queue the API server handles.
- As each event carries a resource version for the particular object it containers, e.g. a pod object, going back in time is actually possible by requesting a specific resource version.

- Consumer and producers are fully decoupled (by the queue) and autonomous as if they don't know each other.
- This makes the whole system extremely scalable, robust and extensible.

- Thus, by design, it's fully asynchronous and eventually consistent platform.
- Information takes time to propagate from producers(s) to consumers(s). 
- Diagram below show this where the `Horizontal Pod Autoscaler` hasn't caught up with th events coming from the metrics server, which also affects the downstream chain of producers and consumers.
  
  ![k8s-api-server-queues.png](https://www.mgasch.com/images/k8s-api-server-queues.png)
  
- There's NO guarantee that the system will converge to the desired state(even if you got an "OK"/ACK from the control place.)
  - For example:
    ```bash
    $ kubectl scale <deploy> --replicas <n> # where sum(cpu_requests) > cluster_capacity
    Scaled deployment <deploy>
    ```
    
    If the control plane is running fine, you'll get a `HTTP 200` return code, i.e. "OK", even though there is no remaining capacity in the cluster.

- Controllers essentially are stateless even though they perform stateful operations, e.g. the scheduler which tracks and reclaculates node capacity on every pod scheduled. 
- For efficiency and speed, received events are placed in in-memory caches or local queues in each controller.


> But what happens to our(local) state if a controller crashes as it does not persist state locally?

- Persistency in the controller is not needed. The event-driven design will replay all(appropriate) events when the controller (re)starts, similar to the concept of [`event-sourcing`](https://martinfowler.com/eaaDev/EventSourcing.html).

















_____________________________________________________________________________________
Notes:
- [Quorum reads](https://github.com/kubernetes/kubernetes/issues/59848) - A quorum is the minimum number of votes that a distributed transaction has to obtain in order to be allowed to perform an operation in a distributed system.
  - Read - https://blog.containership.io/etcd/
  - Also `Raft Consensus Algorithm` - https://raft.github.io/