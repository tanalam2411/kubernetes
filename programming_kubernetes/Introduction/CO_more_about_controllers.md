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
Refs
- [Level Triggering and Reconciliation in Kubernetes - James Bowes](https://www.youtube.com/watch?v=tCht7FvIDdY)
  - [Slide](https://docs.google.com/presentation/d/1o9FMsn7KKLBv05w3Z6qbjFSmsq_M-62X3u52KWz0xEA/edit#slide=id.g3a88bbd291_0_39)
  
##### Work Queue

  - https://godoc.org/k8s.io/client-go/util/workqueue
  - https://github.com/kubernetes/client-go/tree/master/util/workqueue