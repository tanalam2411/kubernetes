

```bash
 $ yamls$ kind create cluster --config=kind-config.yaml
```

```bash
yamls$ kubectl create -f rbac.yaml 
clusterrole.rbac.authorization.k8s.io/node-problem-detector-cluster-role created
clusterrolebinding.rbac.authorization.k8s.io/node-problem-detector-cluster-role-binding created
```

```bash
yamls$ kubectl create -f node-problem-detector-config.yaml 
configmap/node-problem-detector-config created
```

```bash
yamls$ kubectl create -f node-problem-detector.yaml 
daemonset.apps/node-problem-detector created
```

```bash
yamls$ kubectl get all -A
NAMESPACE            NAME                                             READY   STATUS    RESTARTS   AGE
kube-system          pod/coredns-f9fd979d6-v8sf4                      1/1     Running   0          7m14s
kube-system          pod/coredns-f9fd979d6-xv6km                      1/1     Running   0          7m14s
kube-system          pod/etcd-kind-control-plane                      1/1     Running   0          7m18s
kube-system          pod/kindnet-kdqfg                                1/1     Running   0          7m14s
kube-system          pod/kindnet-qp777                                1/1     Running   0          6m56s
kube-system          pod/kindnet-xsv7h                                1/1     Running   0          6m56s
kube-system          pod/kube-apiserver-kind-control-plane            1/1     Running   0          7m18s
kube-system          pod/kube-controller-manager-kind-control-plane   1/1     Running   0          7m18s
kube-system          pod/kube-proxy-256jg                             1/1     Running   0          7m14s
kube-system          pod/kube-proxy-sdcdg                             1/1     Running   0          6m56s
kube-system          pod/kube-proxy-xzdhj                             1/1     Running   0          6m56s
kube-system          pod/kube-scheduler-kind-control-plane            1/1     Running   0          7m18s
kube-system          pod/node-problem-detector-bck7k                  1/1     Running   0          95s
kube-system          pod/node-problem-detector-tcbz9                  1/1     Running   0          95s
kube-system          pod/node-problem-detector-vcpqn                  1/1     Running   0          95s
local-path-storage   pod/local-path-provisioner-78776bfc44-69vgj      1/1     Running   0          7m14s

NAMESPACE     NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE
default       service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP                  7m33s
kube-system   service/kube-dns     ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   7m31s

NAMESPACE     NAME                                   DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
kube-system   daemonset.apps/kindnet                 3         3         3       3            3           <none>                   7m24s
kube-system   daemonset.apps/kube-proxy              3         3         3       3            3           kubernetes.io/os=linux   7m31s
kube-system   daemonset.apps/node-problem-detector   3         3         3       3            3           <none>                   95s

NAMESPACE            NAME                                     READY   UP-TO-DATE   AVAILABLE   AGE
kube-system          deployment.apps/coredns                  2/2     2            2           7m31s
local-path-storage   deployment.apps/local-path-provisioner   1/1     1            1           7m22s

NAMESPACE            NAME                                                DESIRED   CURRENT   READY   AGE
kube-system          replicaset.apps/coredns-f9fd979d6                   2         2         2       7m14s
local-path-storage   replicaset.apps/local-path-provisioner-78776bfc44   1         1         1       7m14s
```

```bash
yamls$ kubectl get no
NAME                 STATUS   ROLES    AGE     VERSION
kind-control-plane   Ready    master   9m28s   v1.19.1
kind-worker          Ready    <none>   8m45s   v1.19.1
kind-worker2         Ready    <none>   8m45s   v1.19.1
```

```bash
yamls$ kubectl get no kind-worker -o json | jq '.status.conditions'
[
  {
    "lastHeartbeatTime": "2021-05-06T17:15:22Z",
    "lastTransitionTime": "2021-05-06T17:15:21Z",
    "message": "kernel has no deadlock",
    "reason": "KernelHasNoDeadlock",
    "status": "False",
    "type": "KernelDeadlock"
  },
  {
    "lastHeartbeatTime": "2021-05-06T17:15:22Z",
    "lastTransitionTime": "2021-05-06T17:15:21Z",
    "message": "Filesystem is not read-only",
    "reason": "FilesystemIsNotReadOnly",
    "status": "False",
    "type": "ReadonlyFilesystem"
  },
  {
    "lastHeartbeatTime": "2021-05-06T17:15:06Z",
    "lastTransitionTime": "2021-05-06T17:09:06Z",
    "message": "kubelet has sufficient memory available",
    "reason": "KubeletHasSufficientMemory",
    "status": "False",
    "type": "MemoryPressure"
  },
  {
    "lastHeartbeatTime": "2021-05-06T17:15:06Z",
    "lastTransitionTime": "2021-05-06T17:09:06Z",
    "message": "kubelet has no disk pressure",
    "reason": "KubeletHasNoDiskPressure",
    "status": "False",
    "type": "DiskPressure"
  },
  {
    "lastHeartbeatTime": "2021-05-06T17:15:06Z",
    "lastTransitionTime": "2021-05-06T17:09:06Z",
    "message": "kubelet has sufficient PID available",
    "reason": "KubeletHasSufficientPID",
    "status": "False",
    "type": "PIDPressure"
  },
  {
    "lastHeartbeatTime": "2021-05-06T17:15:06Z",
    "lastTransitionTime": "2021-05-06T17:09:56Z",
    "message": "kubelet is posting ready status",
    "reason": "KubeletReady",
    "status": "True",
    "type": "Ready"
  }
]

```