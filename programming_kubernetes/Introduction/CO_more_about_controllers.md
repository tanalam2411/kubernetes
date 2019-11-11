`......................................................... GoTo` [***`Introduction`***](README.md)


**More about Controllers**

- `The Control Loop`: looks as follows:
  1) Reads the state of resources, preferably event-driven (using `watches`).  
  2) Change the state of objects in the cluster or the cluster external world.
      - Example, launch a `pod`, create a `network endpoint`, or query a `cloud API`.
  3) Update status of the resource in step 1 via the API server in `etcd`.
  4) Repeat cycle; return to step 1. 
  ![Figure 1-2. kubernetes control loop](static_files/fig_1-2.kubernetes_control_loop.png)
  
  The main loop(in the middle) is continuously running inside of the controller process.
  - This process is usually running inside a pod in the cluster.
  
  **Informers** - Watches the desired state of resources in a scalable ans sustainable fasion.
    - They also implement a resync mechanism that enforces periodic [`reconciliation`](https://speakerdeck.com/thockin/kubernetes-what-is-reconciliation)`(the action of making one view compatible with another)`.
    - Periodic Reconciliation - is often used to make sure that the cluster state and the assumed state cached in memory do no drift`(carried away)` due to bugs or network issues etc.
    
  **Work queues** - Is used by the event handler to handle queuing of state changes and help to implement retries. [Work Queue](#work-queue)
    - Resources can be requeued in case of errors when updating the world(object)  or writing the status(steps 2 and 3 in the `The Control Loop` above), 
      - Or just because  we have to consider the resource after some time for other reasons.
      [`MORE`](static_files/The_Mechanics_of_Kubernetes_-_Dominik_Tornow_-_Medium.pdf)
  
_______________________________________________________________________________________________________________
[`ref`](https://www.youtube.com/watch?v=zCXiXKMqnuE)[`slide`](https://static.sched.com/hosted_files/kccnceu19/c0/control%20plane%20in%20pictures%20final.pdf)

An Ideal CONTROLLER should be:
1. Only do one thing.
2. HAve an input source.
3. Have a place to write status.
4. Have an output location.
5. Anticipate its own effects on the rest of the system.
6. Break things exactly a little bit on failure.

**Controller Categories:**
1. The `CLASSIC` controllers
2. Standing Query/"Table Join"
3. In OR Bijection enforcers

<u>**Classic Controller</u>:**
  1. `POD` garbage collector **:** Get rid of finished pods.
  2. `Namespace` Lifecycle controller **:** Deletes objects within namespace when namespace goes in deletion phase.
  3. Actual `Garbage Collector` **:** It frees your regular controllers from having to tear down the structures that they make, 
  because you setup the parent pointers on your objects and there's a metadata field and the gc collector is just sits there and 
  watches and when the parent objects go away it'll delete the child objects and free up your whole hierarchy for you.
  The earlier replica set or deployment code before gc was added, was actually a 
  significant amount of work to clean up everything correctly. So it is advised to use it in controllers.
  4. Certificate Signing Request Controller **:** There are 3 controllers works together **:**
  
    i. CSR Cleaner controller:  Deletes certificates CSRs after they've expired
    ii. CSR Signing controller: Signs approved CSRs.
    iii. CSR Approver: Auto approves from nodes.
    These controllers are good example of do one thing controller.
  5. Persistent Volume and Persistent Volume Claim Protection (PV and PVC protection)controller
  6. TTL-After-Finished controller **:** Time based garbage collector
  7. Replica-set controller
  8. Deployment controller
  9. [HorizontalPodAutoScaler](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) Controller
  10. [ClusterAutoScaler](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler)
  
<u>**Standing Query/Table Join</u>:**
  - Watches `pods` and `services` and matches them up and writes `endpoints`
  - Pod disruption(admission plugin) and resource quota
  - CSR Approver
  - CLuster Role aggregation
  
<u>**IN|BI-Jection Enforcer</u>:**
  - DeamonSet Controller
  - Service Account Controller
  - Nodelifecycle controller
  - Cloud-Node controller
  - Root-ca-cert-publisher controller
  - Scheduler
  - SchedulerJobController
  - Job controller
  - Statefulset controller
  - kublet
  - 


_______________________________________________________________________________________________________________
Refs
- [Level Triggering and Reconciliation in Kubernetes - James Bowes](https://www.youtube.com/watch?v=tCht7FvIDdY)
  - [Slide](https://docs.google.com/presentation/d/1o9FMsn7KKLBv05w3Z6qbjFSmsq_M-62X3u52KWz0xEA/edit#slide=id.g3a88bbd291_0_39)
  
##### Work Queue

  - https://godoc.org/k8s.io/client-go/util/workqueue
  - https://github.com/kubernetes/client-go/tree/master/util/workqueue