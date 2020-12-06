

```bash
afour@A4G354-PCUbuntu:~$ kd nodes | grep -i "Taint"
Taints:             node-role.kubernetes.io/master:NoSchedule
Taints:             <none>
Taints:             <none>
afour@A4G354-PCUbuntu:~$ kd nodes | grep -i "taint"
Taints:             node-role.kubernetes.io/master:NoSchedule
Taints:             <none>
Taints:             <none>
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ alias k='kubectl' 
afour@A4G354-PCUbuntu:~$ alias kd='kubectl describe'
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k gt no
Error: unknown command "gt" for "kubectl"

Did you mean this?
	set
	get
	cp

Run 'kubectl --help' for usage.
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get no
NAME                 STATUS   ROLES    AGE     VERSION
kind-control-plane   Ready    master   7h19m   v1.19.1
kind-worker          Ready    <none>   7h18m   v1.19.1
kind-worker2         Ready    <none>   7h18m   v1.19.1
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po
NAME   READY   STATUS    RESTARTS   AGE
pod1   1/1     Running   0          3h7m
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po -o wide
NAME   READY   STATUS    RESTARTS   AGE    IP           NODE          NOMINATED NODE   READINESS GATES
pod1   1/1     Running   0          3h8m   10.244.2.2   kind-worker   <none>           <none>
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k create deploy green --image=nginx --port=80 --dry-client=client -o yaml
Error: unknown flag: --dry-client
See 'kubectl create deployment --help' for usage.
afour@A4G354-PCUbuntu:~$ k create deploy green --image=nginx --port=80 --dry-run=client -o yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: green
  name: green
spec:
  replicas: 1
  selector:
    matchLabels:
      app: green
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: green
    spec:
      containers:
      - image: nginx
        name: nginx
        ports:
        - containerPort: 80
        resources: {}
status: {}
afour@A4G354-PCUbuntu:~$ k create deploy green --image=nginx --port=80 --dry-run=client -o yaml > green.yaml
afour@A4G354-PCUbuntu:~$ cat green.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: green
  name: green
spec:
  replicas: 1
  selector:
    matchLabels:
      app: green
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: green
    spec:
      containers:
      - image: nginx
        name: nginx
        ports:
        - containerPort: 80
        resources: {}
status: {}
afour@A4G354-PCUbuntu:~$ vi green.yaml 
afour@A4G354-PCUbuntu:~$ vi green.yaml 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k create -f green.yaml 
deployment.apps/green created
afour@A4G354-PCUbuntu:~$ k get deploy
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
green   0/2     2            0           3s
afour@A4G354-PCUbuntu:~$ k get deploy -w
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
green   0/2     2            0           7s
green   1/2     2            1           10s
green   2/2     2            2           10s
^Cafour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po -o wide
NAME                    READY   STATUS    RESTARTS   AGE     IP           NODE           NOMINATED NODE   READINESS GATES
green-fd57ffc44-hwphs   1/1     Running   0          16s     10.244.2.3   kind-worker    <none>           <none>
green-fd57ffc44-ld49p   1/1     Running   0          16s     10.244.1.3   kind-worker2   <none>           <none>
pod1                    1/1     Running   0          3h11m   10.244.2.2   kind-worker    <none>           <none>
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k create svc green-svc nodeport --node-port=31000 --tcp=80:80 --dry-run=client -o yaml
Error: unknown flag: --node-port
See 'kubectl create service --help' for usage.
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k create svc green-svc nodeport --node-port 31000 --tcp 80:80 --dry-run=client -o yaml
Error: unknown flag: --node-port
See 'kubectl create service --help' for usage.
afour@A4G354-PCUbuntu:~$ k create svc nodeport green-svc --node-port 31000 --tcp 80:80 --dry-run=client -o yaml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    app: green-svc
  name: green-svc
spec:
  ports:
  - name: 80-80
    nodePort: 31000
    port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: green-svc
  type: NodePort
status:
  loadBalancer: {}
afour@A4G354-PCUbuntu:~$ k create svc nodeport green-svc --node-port 31000 --tcp 80:80 --dry-run=client -o yaml > green-svc.yaml
afour@A4G354-PCUbuntu:~$ vi green-svc.yaml 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ vi green.yaml 
afour@A4G354-PCUbuntu:~$ vi green-svc.yaml 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k create -f green-svc.yaml 
service/green-svc created
afour@A4G354-PCUbuntu:~$ k get svc
NAME         TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
green-svc    NodePort    10.96.36.187   <none>        80:31000/TCP   2s
kubernetes   ClusterIP   10.96.0.1      <none>        443/TCP        7h27m
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ kd svc green-svc
Name:                     green-svc
Namespace:                default
Labels:                   app=green
Annotations:              <none>
Selector:                 app=green
Type:                     NodePort
IP:                       10.96.36.187
Port:                     green-port  80/TCP
TargetPort:               80/TCP
NodePort:                 green-port  31000/TCP
Endpoints:                10.244.1.3:80,10.244.2.3:80
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get no
NAME                 STATUS   ROLES    AGE     VERSION
kind-control-plane   Ready    master   7h28m   v1.19.1
kind-worker          Ready    <none>   7h27m   v1.19.1
kind-worker2         Ready    <none>   7h27m   v1.19.1
afour@A4G354-PCUbuntu:~$ k get no -o wide
NAME                 STATUS   ROLES    AGE     VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE                                     KERNEL-VERSION     CONTAINER-RUNTIME
kind-control-plane   Ready    master   7h28m   v1.19.1   172.18.0.4    <none>        Ubuntu Groovy Gorilla (development branch)   5.3.0-28-generic   containerd://1.4.0
kind-worker          Ready    <none>   7h27m   v1.19.1   172.18.0.2    <none>        Ubuntu Groovy Gorilla (development branch)   5.3.0-28-generic   containerd://1.4.0
kind-worker2         Ready    <none>   7h27m   v1.19.1   172.18.0.3    <none>        Ubuntu Groovy Gorilla (development branch)   5.3.0-28-generic   containerd://1.4.0
afour@A4G354-PCUbuntu:~$ ping 172.18.0.4
PING 172.18.0.4 (172.18.0.4) 56(84) bytes of data.
64 bytes from 172.18.0.4: icmp_seq=1 ttl=64 time=0.099 ms
64 bytes from 172.18.0.4: icmp_seq=2 ttl=64 time=0.063 ms
^C
--- 172.18.0.4 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1031ms
rtt min/avg/max/mdev = 0.063/0.081/0.099/0.018 ms
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ curl http://172.18.0.4:31000
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
afour@A4G354-PCUbuntu:~$ k get no -o wide
NAME                 STATUS   ROLES    AGE     VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE                                     KERNEL-VERSION     CONTAINER-RUNTIME
kind-control-plane   Ready    master   7h29m   v1.19.1   172.18.0.4    <none>        Ubuntu Groovy Gorilla (development branch)   5.3.0-28-generic   containerd://1.4.0
kind-worker          Ready    <none>   7h28m   v1.19.1   172.18.0.2    <none>        Ubuntu Groovy Gorilla (development branch)   5.3.0-28-generic   containerd://1.4.0
kind-worker2         Ready    <none>   7h28m   v1.19.1   172.18.0.3    <none>        Ubuntu Groovy Gorilla (development branch)   5.3.0-28-generic   containerd://1.4.0
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po
NAME                    READY   STATUS    RESTARTS   AGE
green-fd57ffc44-hwphs   1/1     Running   0          6m42s
green-fd57ffc44-ld49p   1/1     Running   0          6m42s
pod1                    1/1     Running   0          3h17m
afour@A4G354-PCUbuntu:~$ k get po -o wide
NAME                    READY   STATUS    RESTARTS   AGE     IP           NODE           NOMINATED NODE   READINESS GATES
green-fd57ffc44-hwphs   1/1     Running   0          6m49s   10.244.2.3   kind-worker    <none>           <none>
green-fd57ffc44-ld49p   1/1     Running   0          6m49s   10.244.1.3   kind-worker2   <none>           <none>
pod1                    1/1     Running   0          3h17m   10.244.2.2   kind-worker    <none>           <none>
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get no
NAME                 STATUS   ROLES    AGE     VERSION
kind-control-plane   Ready    master   7h30m   v1.19.1
kind-worker          Ready    <none>   7h29m   v1.19.1
kind-worker2         Ready    <none>   7h29m   v1.19.1
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ kd no kind-worker2
Name:               kind-worker2
Roles:              <none>
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux
                    kubernetes.io/arch=amd64
                    kubernetes.io/hostname=kind-worker2
                    kubernetes.io/os=linux
Annotations:        kubeadm.alpha.kubernetes.io/cri-socket: unix:///run/containerd/containerd.sock
                    node.alpha.kubernetes.io/ttl: 0
                    volumes.kubernetes.io/controller-managed-attach-detach: true
CreationTimestamp:  Wed, 02 Dec 2020 12:04:39 +0530
Taints:             <none>
Unschedulable:      false
Lease:
  HolderIdentity:  kind-worker2
  AcquireTime:     <unset>
  RenewTime:       Wed, 02 Dec 2020 19:34:20 +0530
Conditions:
  Type             Status  LastHeartbeatTime                 LastTransitionTime                Reason                       Message
  ----             ------  -----------------                 ------------------                ------                       -------
  MemoryPressure   False   Wed, 02 Dec 2020 19:30:24 +0530   Wed, 02 Dec 2020 12:04:39 +0530   KubeletHasSufficientMemory   kubelet has sufficient memory available
  DiskPressure     False   Wed, 02 Dec 2020 19:30:24 +0530   Wed, 02 Dec 2020 12:04:39 +0530   KubeletHasNoDiskPressure     kubelet has no disk pressure
  PIDPressure      False   Wed, 02 Dec 2020 19:30:24 +0530   Wed, 02 Dec 2020 12:04:39 +0530   KubeletHasSufficientPID      kubelet has sufficient PID available
  Ready            True    Wed, 02 Dec 2020 19:30:24 +0530   Wed, 02 Dec 2020 12:05:34 +0530   KubeletReady                 kubelet is posting ready status
Addresses:
  InternalIP:  172.18.0.3
  Hostname:    kind-worker2
Capacity:
  cpu:                8
  ephemeral-storage:  958139552Ki
  hugepages-1Gi:      0
  hugepages-2Mi:      0
  memory:             16291844Ki
  pods:               110
Allocatable:
  cpu:                8
  ephemeral-storage:  958139552Ki
  hugepages-1Gi:      0
  hugepages-2Mi:      0
  memory:             16291844Ki
  pods:               110
System Info:
  Machine ID:                 7d0b3a7829964e34b02397e28724a9a8
  System UUID:                0656a2d9-74c1-411d-ab04-4c31a437cff7
  Boot ID:                    e1d31edf-e278-46f9-83b7-358ac2a74842
  Kernel Version:             5.3.0-28-generic
  OS Image:                   Ubuntu Groovy Gorilla (development branch)
  Operating System:           linux
  Architecture:               amd64
  Container Runtime Version:  containerd://1.4.0
  Kubelet Version:            v1.19.1
  Kube-Proxy Version:         v1.19.1
PodCIDR:                      10.244.1.0/24
PodCIDRs:                     10.244.1.0/24
ProviderID:                   kind://docker/kind/kind-worker2
Non-terminated Pods:          (3 in total)
  Namespace                   Name                     CPU Requests  CPU Limits  Memory Requests  Memory Limits  AGE
  ---------                   ----                     ------------  ----------  ---------------  -------------  ---
  default                     green-fd57ffc44-ld49p    0 (0%)        0 (0%)      0 (0%)           0 (0%)         7m50s
  kube-system                 kindnet-42lvq            100m (1%)     100m (1%)   50Mi (0%)        50Mi (0%)      7h29m
  kube-system                 kube-proxy-gwmrj         0 (0%)        0 (0%)      0 (0%)           0 (0%)         7h29m
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource           Requests   Limits
  --------           --------   ------
  cpu                100m (1%)  100m (1%)
  memory             50Mi (0%)  50Mi (0%)
  ephemeral-storage  0 (0%)     0 (0%)
  hugepages-1Gi      0 (0%)     0 (0%)
  hugepages-2Mi      0 (0%)     0 (0%)
Events:              <none>
afour@A4G354-PCUbuntu:~$ kd no kind-worker2 | grep -i Taint
Taints:             <none>
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get no
NAME                 STATUS   ROLES    AGE     VERSION
kind-control-plane   Ready    master   7h30m   v1.19.1
kind-worker          Ready    <none>   7h30m   v1.19.1
kind-worker2         Ready    <none>   7h30m   v1.19.1
afour@A4G354-PCUbuntu:~$ kd no kind-control-plane | grep -i Taint
Taints:             node-role.kubernetes.io/master:NoSchedule
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k cordon kind-worker2
node/kind-worker2 cordoned
afour@A4G354-PCUbuntu:~$ k get no
NAME                 STATUS                     ROLES    AGE     VERSION
kind-control-plane   Ready                      master   7h31m   v1.19.1
kind-worker          Ready                      <none>   7h30m   v1.19.1
kind-worker2         Ready,SchedulingDisabled   <none>   7h30m   v1.19.1
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get no
NAME                 STATUS                     ROLES    AGE     VERSION
kind-control-plane   Ready                      master   7h33m   v1.19.1
kind-worker          Ready                      <none>   7h32m   v1.19.1
kind-worker2         Ready,SchedulingDisabled   <none>   7h32m   v1.19.1
afour@A4G354-PCUbuntu:~$ k get po
NAME                    READY   STATUS    RESTARTS   AGE
green-fd57ffc44-hwphs   1/1     Running   0          10m
green-fd57ffc44-ld49p   1/1     Running   0          10m
pod1                    1/1     Running   0          3h21m
afour@A4G354-PCUbuntu:~$ k get po -o wide
NAME                    READY   STATUS    RESTARTS   AGE     IP           NODE           NOMINATED NODE   READINESS GATES
green-fd57ffc44-hwphs   1/1     Running   0          10m     10.244.2.3   kind-worker    <none>           <none>
green-fd57ffc44-ld49p   1/1     Running   0          10m     10.244.1.3   kind-worker2   <none>           <none>
pod1                    1/1     Running   0          3h21m   10.244.2.2   kind-worker    <none>           <none>
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k drain node kind-worker2
Error from server (NotFound): nodes "node" not found
afour@A4G354-PCUbuntu:~$ k drain kind-worker2
node/kind-worker2 already cordoned
error: unable to drain node "kind-worker2", aborting command...

There are pending nodes to be drained:
 kind-worker2
error: cannot delete DaemonSet-managed Pods (use --ignore-daemonsets to ignore): kube-system/kindnet-42lvq, kube-system/kube-proxy-gwmrj
afour@A4G354-PCUbuntu:~$ k drain kind-worker2 --ignore-daemonsets
node/kind-worker2 already cordoned
WARNING: ignoring DaemonSet-managed Pods: kube-system/kindnet-42lvq, kube-system/kube-proxy-gwmrj
evicting pod default/green-fd57ffc44-ld49p
pod/green-fd57ffc44-ld49p evicted
node/kind-worker2 evicted
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po -o wide
NAME                    READY   STATUS    RESTARTS   AGE     IP           NODE          NOMINATED NODE   READINESS GATES
green-fd57ffc44-hhkd4   1/1     Running   0          21s     10.244.2.4   kind-worker   <none>           <none>
green-fd57ffc44-hwphs   1/1     Running   0          12m     10.244.2.3   kind-worker   <none>           <none>
pod1                    1/1     Running   0          3h23m   10.244.2.2   kind-worker   <none>           <none>
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get no
NAME                 STATUS                     ROLES    AGE     VERSION
kind-control-plane   Ready                      master   7h35m   v1.19.1
kind-worker          Ready                      <none>   7h34m   v1.19.1
kind-worker2         Ready,SchedulingDisabled   <none>   7h34m   v1.19.1
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ kd node kind-control-plane | grep -i Tai
Annotations:        kubeadm.alpha.kubernetes.io/cri-socket: unix:///run/containerd/containerd.sock
Taints:             node-role.kubernetes.io/master:NoSchedule
  Container Runtime Version:  containerd://1.4.0
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k taint nodes --all node-role.kubernetes.io/master:NoSchedule-
node/kind-control-plane untainted
taint "node-role.kubernetes.io/master:NoSchedule" not found
taint "node-role.kubernetes.io/master:NoSchedule" not found
afour@A4G354-PCUbuntu:~$ k get no
NAME                 STATUS                     ROLES    AGE     VERSION
kind-control-plane   Ready                      master   7h36m   v1.19.1
kind-worker          Ready                      <none>   7h35m   v1.19.1
kind-worker2         Ready,SchedulingDisabled   <none>   7h35m   v1.19.1
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ kd node kind-worker2 | grep -i Tai
Annotations:        kubeadm.alpha.kubernetes.io/cri-socket: unix:///run/containerd/containerd.sock
Taints:             node.kubernetes.io/unschedulable:NoSchedule
  Container Runtime Version:  containerd://1.4.0
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get deploy
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
green   2/2     2            2           15m
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k edit deploy green
deployment.apps/green edited
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po
NAME                    READY   STATUS              RESTARTS   AGE
green-fd57ffc44-bmb9b   0/1     ContainerCreating   0          2s
green-fd57ffc44-cpd78   0/1     ContainerCreating   0          2s
green-fd57ffc44-dfphw   0/1     ContainerCreating   0          2s
green-fd57ffc44-hhkd4   1/1     Running             0          3m42s
green-fd57ffc44-hwphs   1/1     Running             0          15m
green-fd57ffc44-mg5bl   0/1     ContainerCreating   0          2s
green-fd57ffc44-np84q   0/1     ContainerCreating   0          2s
green-fd57ffc44-tmtgl   0/1     ContainerCreating   0          2s
green-fd57ffc44-v58fq   0/1     ContainerCreating   0          2s
green-fd57ffc44-wcv9x   0/1     ContainerCreating   0          2s
pod1                    1/1     Running             0          3h26m
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po -o wide
NAME                    READY   STATUS              RESTARTS   AGE     IP           NODE                 NOMINATED NODE   READINESS GATES
green-fd57ffc44-bmb9b   0/1     ContainerCreating   0          8s      <none>       kind-control-plane   <none>           <none>
green-fd57ffc44-cpd78   0/1     ContainerCreating   0          8s      <none>       kind-worker          <none>           <none>
green-fd57ffc44-dfphw   1/1     Running             0          8s      10.244.2.5   kind-worker          <none>           <none>
green-fd57ffc44-hhkd4   1/1     Running             0          3m48s   10.244.2.4   kind-worker          <none>           <none>
green-fd57ffc44-hwphs   1/1     Running             0          15m     10.244.2.3   kind-worker          <none>           <none>
green-fd57ffc44-mg5bl   0/1     ContainerCreating   0          8s      <none>       kind-control-plane   <none>           <none>
green-fd57ffc44-np84q   0/1     ContainerCreating   0          8s      <none>       kind-control-plane   <none>           <none>
green-fd57ffc44-tmtgl   0/1     ContainerCreating   0          8s      <none>       kind-worker          <none>           <none>
green-fd57ffc44-v58fq   0/1     ContainerCreating   0          8s      <none>       kind-control-plane   <none>           <none>
green-fd57ffc44-wcv9x   0/1     ContainerCreating   0          8s      <none>       kind-control-plane   <none>           <none>
pod1                    1/1     Running             0          3h26m   10.244.2.2   kind-worker          <none>           <none>
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po -o wide
NAME                    READY   STATUS              RESTARTS   AGE     IP           NODE                 NOMINATED NODE   READINESS GATES
green-fd57ffc44-bmb9b   0/1     ContainerCreating   0          29s     <none>       kind-control-plane   <none>           <none>
green-fd57ffc44-cpd78   1/1     Running             0          29s     10.244.2.7   kind-worker          <none>           <none>
green-fd57ffc44-dfphw   1/1     Running             0          29s     10.244.2.5   kind-worker          <none>           <none>
green-fd57ffc44-hhkd4   1/1     Running             0          4m9s    10.244.2.4   kind-worker          <none>           <none>
green-fd57ffc44-hwphs   1/1     Running             0          15m     10.244.2.3   kind-worker          <none>           <none>
green-fd57ffc44-mg5bl   0/1     ContainerCreating   0          29s     <none>       kind-control-plane   <none>           <none>
green-fd57ffc44-np84q   0/1     ContainerCreating   0          29s     <none>       kind-control-plane   <none>           <none>
green-fd57ffc44-tmtgl   1/1     Running             0          29s     10.244.2.6   kind-worker          <none>           <none>
green-fd57ffc44-v58fq   0/1     ContainerCreating   0          29s     <none>       kind-control-plane   <none>           <none>
green-fd57ffc44-wcv9x   0/1     ContainerCreating   0          29s     <none>       kind-control-plane   <none>           <none>
pod1                    1/1     Running             0          3h26m   10.244.2.2   kind-worker          <none>           <none>
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po -o wide
NAME                    READY   STATUS              RESTARTS   AGE     IP           NODE                 NOMINATED NODE   READINESS GATES
green-fd57ffc44-bmb9b   1/1     Running             0          34s     10.244.0.8   kind-control-plane   <none>           <none>
green-fd57ffc44-cpd78   1/1     Running             0          34s     10.244.2.7   kind-worker          <none>           <none>
green-fd57ffc44-dfphw   1/1     Running             0          34s     10.244.2.5   kind-worker          <none>           <none>
green-fd57ffc44-hhkd4   1/1     Running             0          4m14s   10.244.2.4   kind-worker          <none>           <none>
green-fd57ffc44-hwphs   1/1     Running             0          16m     10.244.2.3   kind-worker          <none>           <none>
green-fd57ffc44-mg5bl   1/1     Running             0          34s     10.244.0.5   kind-control-plane   <none>           <none>
green-fd57ffc44-np84q   0/1     ContainerCreating   0          34s     <none>       kind-control-plane   <none>           <none>
green-fd57ffc44-tmtgl   1/1     Running             0          34s     10.244.2.6   kind-worker          <none>           <none>
green-fd57ffc44-v58fq   0/1     ContainerCreating   0          34s     <none>       kind-control-plane   <none>           <none>
green-fd57ffc44-wcv9x   0/1     ContainerCreating   0          34s     <none>       kind-control-plane   <none>           <none>
pod1                    1/1     Running             0          3h26m   10.244.2.2   kind-worker          <none>           <none>
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get nodes -o wide
NAME                 STATUS                     ROLES    AGE     VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE                                     KERNEL-VERSION     CONTAINER-RUNTIME
kind-control-plane   Ready                      master   7h39m   v1.19.1   172.18.0.4    <none>        Ubuntu Groovy Gorilla (development branch)   5.3.0-28-generic   containerd://1.4.0
kind-worker          Ready                      <none>   7h38m   v1.19.1   172.18.0.2    <none>        Ubuntu Groovy Gorilla (development branch)   5.3.0-28-generic   containerd://1.4.0
kind-worker2         Ready,SchedulingDisabled   <none>   7h38m   v1.19.1   172.18.0.3    <none>        Ubuntu Groovy Gorilla (development branch)   5.3.0-28-generic   containerd://1.4.0
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get nodes -o wide
NAME                 STATUS                     ROLES    AGE     VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE                                     KERNEL-VERSION     CONTAINER-RUNTIME
kind-control-plane   Ready                      master   7h42m   v1.19.1   172.18.0.4    <none>        Ubuntu Groovy Gorilla (development branch)   5.3.0-28-generic   containerd://1.4.0
kind-worker          Ready                      <none>   7h41m   v1.19.1   172.18.0.2    <none>        Ubuntu Groovy Gorilla (development branch)   5.3.0-28-generic   containerd://1.4.0
kind-worker2         Ready,SchedulingDisabled   <none>   7h41m   v1.19.1   172.18.0.3    <none>        Ubuntu Groovy Gorilla (development branch)   5.3.0-28-generic   containerd://1.4.0
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ ssh root@172.18.0.4
ssh: connect to host 172.18.0.4 port 22: Connection refused
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po
NAME                    READY   STATUS    RESTARTS   AGE
green-fd57ffc44-bmb9b   1/1     Running   0          6m54s
green-fd57ffc44-cpd78   1/1     Running   0          6m54s
green-fd57ffc44-dfphw   1/1     Running   0          6m54s
green-fd57ffc44-hhkd4   1/1     Running   0          10m
green-fd57ffc44-hwphs   1/1     Running   0          22m
green-fd57ffc44-mg5bl   1/1     Running   0          6m54s
green-fd57ffc44-np84q   1/1     Running   0          6m54s
green-fd57ffc44-tmtgl   1/1     Running   0          6m54s
green-fd57ffc44-v58fq   1/1     Running   0          6m54s
green-fd57ffc44-wcv9x   1/1     Running   0          6m54s
pod1                    1/1     Running   0          3h33m
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k edit po green-fd57ffc44-bmb9b
pod/green-fd57ffc44-bmb9b edited
afour@A4G354-PCUbuntu:~$ k get po
NAME                    READY   STATUS    RESTARTS   AGE
green-fd57ffc44-bmb9b   1/1     Running   0          7m30s
green-fd57ffc44-cpd78   1/1     Running   0          7m30s
green-fd57ffc44-dfphw   1/1     Running   0          7m30s
green-fd57ffc44-hhkd4   1/1     Running   0          11m
green-fd57ffc44-hwphs   1/1     Running   0          22m
green-fd57ffc44-mg5bl   1/1     Running   0          7m30s
green-fd57ffc44-np84q   1/1     Running   0          7m30s
green-fd57ffc44-sld4p   1/1     Running   0          7s
green-fd57ffc44-tmtgl   1/1     Running   0          7m30s
green-fd57ffc44-v58fq   1/1     Running   0          7m30s
green-fd57ffc44-wcv9x   1/1     Running   0          7m30s
pod1                    1/1     Running   0          3h33m
afour@A4G354-PCUbuntu:~$ k get po -w c
Error from server (NotFound): pods "c" not found
afour@A4G354-PCUbuntu:~$ k get po -l
Error: flag needs an argument: 'l' in -l
See 'kubectl get --help' for usage.
afour@A4G354-PCUbuntu:~$ k get po -l app=green
NAME                    READY   STATUS    RESTARTS   AGE
green-fd57ffc44-cpd78   1/1     Running   0          7m47s
green-fd57ffc44-dfphw   1/1     Running   0          7m47s
green-fd57ffc44-hhkd4   1/1     Running   0          11m
green-fd57ffc44-hwphs   1/1     Running   0          23m
green-fd57ffc44-mg5bl   1/1     Running   0          7m47s
green-fd57ffc44-np84q   1/1     Running   0          7m47s
green-fd57ffc44-sld4p   1/1     Running   0          24s
green-fd57ffc44-tmtgl   1/1     Running   0          7m47s
green-fd57ffc44-v58fq   1/1     Running   0          7m47s
green-fd57ffc44-wcv9x   1/1     Running   0          7m47s
afour@A4G354-PCUbuntu:~$ k edit po green-fd57ffc44-bmb9b
pod/green-fd57ffc44-bmb9b edited
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po -l app=yellow
NAME                    READY   STATUS    RESTARTS   AGE
green-fd57ffc44-bmb9b   1/1     Running   0          8m59s
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po -l app=green | grep green-fd57ffc44-bmb9b
afour@A4G354-PCUbuntu:~$ k get po -l app=green | wc -l
11
afour@A4G354-PCUbuntu:~$ k get po  | wc -l
13
afour@A4G354-PCUbuntu:~$ k get po
NAME                    READY   STATUS    RESTARTS   AGE
green-fd57ffc44-bmb9b   1/1     Running   0          9m36s
green-fd57ffc44-cpd78   1/1     Running   0          9m36s
green-fd57ffc44-dfphw   1/1     Running   0          9m36s
green-fd57ffc44-hhkd4   1/1     Running   0          13m
green-fd57ffc44-hwphs   1/1     Running   0          25m
green-fd57ffc44-mg5bl   1/1     Running   0          9m36s
green-fd57ffc44-np84q   1/1     Running   0          9m36s
green-fd57ffc44-sld4p   1/1     Running   0          2m13s
green-fd57ffc44-tmtgl   1/1     Running   0          9m36s
green-fd57ffc44-v58fq   1/1     Running   0          9m36s
green-fd57ffc44-wcv9x   1/1     Running   0          9m36s
pod1                    1/1     Running   0          3h35m
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get svc
NAME         TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
green-svc    NodePort    10.96.36.187   <none>        80:31000/TCP   21m
kubernetes   ClusterIP   10.96.0.1      <none>        443/TCP        7h48m
afour@A4G354-PCUbuntu:~$ k get svc gree-svc
Error from server (NotFound): services "gree-svc" not found
afour@A4G354-PCUbuntu:~$ k get svc green-svc
NAME        TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
green-svc   NodePort   10.96.36.187   <none>        80:31000/TCP   21m
afour@A4G354-PCUbuntu:~$ kd svc green-svc
Name:                     green-svc
Namespace:                default
Labels:                   app=green
Annotations:              <none>
Selector:                 app=green
Type:                     NodePort
IP:                       10.96.36.187
Port:                     green-port  80/TCP
TargetPort:               80/TCP
NodePort:                 green-port  31000/TCP
Endpoints:                10.244.0.10:80,10.244.0.5:80,10.244.0.6:80 + 7 more...
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>
afour@A4G354-PCUbuntu:~$ kd svc green-svc -o yaml
Error: unknown shorthand flag: 'o' in -o
See 'kubectl describe --help' for usage.
afour@A4G354-PCUbuntu:~$ kd svc green-svc -o yaml
Error: unknown shorthand flag: 'o' in -o
See 'kubectl describe --help' for usage.
afour@A4G354-PCUbuntu:~$ kd svc green-svc -o json
Error: unknown shorthand flag: 'o' in -o
See 'kubectl describe --help' for usage.
afour@A4G354-PCUbuntu:~$ k get svc green-svc -o yaml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: "2020-12-02T14:01:33Z"
  labels:
    app: green
  managedFields:
  - apiVersion: v1
    fieldsType: FieldsV1
    fieldsV1:
      f:metadata:
        f:labels:
          .: {}
          f:app: {}
      f:spec:
        f:externalTrafficPolicy: {}
        f:ports:
          .: {}
          k:{"port":80,"protocol":"TCP"}:
            .: {}
            f:name: {}
            f:nodePort: {}
            f:port: {}
            f:protocol: {}
            f:targetPort: {}
        f:selector:
          .: {}
          f:app: {}
        f:sessionAffinity: {}
        f:type: {}
    manager: kubectl-create
    operation: Update
    time: "2020-12-02T14:01:33Z"
  name: green-svc
  namespace: default
  resourceVersion: "58323"
  selfLink: /api/v1/namespaces/default/services/green-svc
  uid: 2db163ed-4313-4863-9fdf-a33bb4d36087
spec:
  clusterIP: 10.96.36.187
  externalTrafficPolicy: Cluster
  ports:
  - name: green-port
    nodePort: 31000
    port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: green
  sessionAffinity: None
  type: NodePort
status:
  loadBalancer: {}
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po
NAME                    READY   STATUS    RESTARTS   AGE
green-fd57ffc44-bmb9b   1/1     Running   0          11m
green-fd57ffc44-cpd78   1/1     Running   0          11m
green-fd57ffc44-dfphw   1/1     Running   0          11m
green-fd57ffc44-hhkd4   1/1     Running   0          15m
green-fd57ffc44-hwphs   1/1     Running   0          27m
green-fd57ffc44-mg5bl   1/1     Running   0          11m
green-fd57ffc44-np84q   1/1     Running   0          11m
green-fd57ffc44-sld4p   1/1     Running   0          4m22s
green-fd57ffc44-tmtgl   1/1     Running   0          11m
green-fd57ffc44-v58fq   1/1     Running   0          11m
green-fd57ffc44-wcv9x   1/1     Running   0          11m
pod1                    1/1     Running   0          3h38m
afour@A4G354-PCUbuntu:~$ k delete po pod1
pod "pod1" deleted
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po | grep green | wc -l
11
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po | grep green | wc -l
11
afour@A4G354-PCUbuntu:~$ kd pod green-fd57ffc44-sld4p | grep label
afour@A4G354-PCUbuntu:~$ kd pod green-fd57ffc44-sld4p 
Name:         green-fd57ffc44-sld4p
Namespace:    default
Priority:     0
Node:         kind-control-plane/172.18.0.4
Start Time:   Wed, 02 Dec 2020 19:49:28 +0530
Labels:       app=green
              pod-template-hash=fd57ffc44
Annotations:  <none>
Status:       Running
IP:           10.244.0.10
IPs:
  IP:           10.244.0.10
Controlled By:  ReplicaSet/green-fd57ffc44
Containers:
  nginx:
    Container ID:   containerd://7d0fd554942ecb4bd943c14b60ebe802745c493dd5307faad9dba71a7fa3a9c2
    Image:          nginx
    Image ID:       docker.io/library/nginx@sha256:6b1daa9462046581ac15be20277a7c75476283f969cb3a61c8725ec38d3b01c3
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Wed, 02 Dec 2020 19:49:33 +0530
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-hwpn4 (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  default-token-hwpn4:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  default-token-hwpn4
    Optional:    false
QoS Class:       BestEffort
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                 node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age    From               Message
  ----    ------     ----   ----               -------
  Normal  Scheduled  5m29s  default-scheduler  Successfully assigned default/green-fd57ffc44-sld4p to kind-control-plane
  Normal  Pulling    5m28s  kubelet            Pulling image "nginx"
  Normal  Pulled     5m25s  kubelet            Successfully pulled image "nginx" in 2.750160581s
  Normal  Created    5m24s  kubelet            Created container nginx
  Normal  Started    5m24s  kubelet            Started container nginx
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po
NAME                    READY   STATUS    RESTARTS   AGE
green-fd57ffc44-bmb9b   1/1     Running   0          13m
green-fd57ffc44-cpd78   1/1     Running   0          13m
green-fd57ffc44-dfphw   1/1     Running   0          13m
green-fd57ffc44-hhkd4   1/1     Running   0          16m
green-fd57ffc44-hwphs   1/1     Running   0          28m
green-fd57ffc44-mg5bl   1/1     Running   0          13m
green-fd57ffc44-np84q   1/1     Running   0          13m
green-fd57ffc44-sld4p   1/1     Running   0          5m43s
green-fd57ffc44-tmtgl   1/1     Running   0          13m
green-fd57ffc44-v58fq   1/1     Running   0          13m
green-fd57ffc44-wcv9x   1/1     Running   0          13m
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po -l=yellow
No resources found in default namespace.
afour@A4G354-PCUbuntu:~$ k get po -l app=yellow
NAME                    READY   STATUS    RESTARTS   AGE
green-fd57ffc44-bmb9b   1/1     Running   0          13m
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get no -o wide
NAME                 STATUS                     ROLES    AGE     VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE                                     KERNEL-VERSION     CONTAINER-RUNTIME
kind-control-plane   Ready                      master   7h52m   v1.19.1   172.18.0.4    <none>        Ubuntu Groovy Gorilla (development branch)   5.3.0-28-generic   containerd://1.4.0
kind-worker          Ready                      <none>   7h51m   v1.19.1   172.18.0.2    <none>        Ubuntu Groovy Gorilla (development branch)   5.3.0-28-generic   containerd://1.4.0
kind-worker2         Ready,SchedulingDisabled   <none>   7h51m   v1.19.1   172.18.0.3    <none>        Ubuntu Groovy Gorilla (development branch)   5.3.0-28-generic   containerd://1.4.0
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get svc green-svc -o yaml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: "2020-12-02T14:01:33Z"
  labels:
    app: green
  managedFields:
  - apiVersion: v1
    fieldsType: FieldsV1
    fieldsV1:
      f:metadata:
        f:labels:
          .: {}
          f:app: {}
      f:spec:
        f:externalTrafficPolicy: {}
        f:ports:
          .: {}
          k:{"port":80,"protocol":"TCP"}:
            .: {}
            f:name: {}
            f:nodePort: {}
            f:port: {}
            f:protocol: {}
            f:targetPort: {}
        f:selector:
          .: {}
          f:app: {}
        f:sessionAffinity: {}
        f:type: {}
    manager: kubectl-create
    operation: Update
    time: "2020-12-02T14:01:33Z"
  name: green-svc
  namespace: default
  resourceVersion: "58323"
  selfLink: /api/v1/namespaces/default/services/green-svc
  uid: 2db163ed-4313-4863-9fdf-a33bb4d36087
spec:
  clusterIP: 10.96.36.187
  externalTrafficPolicy: Cluster
  ports:
  - name: green-port
    nodePort: 31000
    port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: green
  sessionAffinity: None
  type: NodePort
status:
  loadBalancer: {}
afour@A4G354-PCUbuntu:~$ k get svc
NAME         TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
green-svc    NodePort    10.96.36.187   <none>        80:31000/TCP   25m
kubernetes   ClusterIP   10.96.0.1      <none>        443/TCP        7h52m
afour@A4G354-PCUbuntu:~$ curl http://172.18.0.4:31000
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
afour@A4G354-PCUbuntu:~$ kubectl 
alpha          attach         completion     create         edit           kustomize      plugin         run            uncordon
annotate       auth           config         delete         exec           label          port-forward   scale          version
api-resources  autoscale      convert        describe       explain        logs           proxy          set            wait
api-versions   certificate    cordon         diff           expose         options        replace        taint          
apply          cluster-info   cp             drain          get            patch          rollout        top            
afour@A4G354-PCUbuntu:~$ kubectl config 
current-context  delete-context   get-contexts     set              set-context      unset            view             
delete-cluster   get-clusters     rename-context   set-cluster      set-credentials  use-context      
afour@A4G354-PCUbuntu:~$ kubectl config --help
Modify kubeconfig files using subcommands like "kubectl config set current-context my-context"

 The loading order follows these rules:

  1.  If the --kubeconfig flag is set, then only that file is loaded. The flag may only be set once and no merging takes
place.
  2.  If $KUBECONFIG environment variable is set, then it is used as a list of paths (normal path delimiting rules for
your system). These paths are merged. When a value is modified, it is modified in the file that defines the stanza. When
a value is created, it is created in the first file that exists. If no files in the chain exist, then it creates the
last file in the list.
  3.  Otherwise, ${HOME}/.kube/config is used and no merging takes place.

Available Commands:
  current-context Displays the current-context
  delete-cluster  Delete the specified cluster from the kubeconfig
  delete-context  Delete the specified context from the kubeconfig
  get-clusters    Display clusters defined in the kubeconfig
  get-contexts    Describe one or many contexts
  rename-context  Renames a context from the kubeconfig file.
  set             Sets an individual value in a kubeconfig file
  set-cluster     Sets a cluster entry in kubeconfig
  set-context     Sets a context entry in kubeconfig
  set-credentials Sets a user entry in kubeconfig
  unset           Unsets an individual value in a kubeconfig file
  use-context     Sets the current-context in a kubeconfig file
  view            Display merged kubeconfig settings or a specified kubeconfig file

Usage:
  kubectl config SUBCOMMAND [options]

Use "kubectl <command> --help" for more information about a given command.
Use "kubectl options" for a list of global command-line options (applies to all commands).
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po
NAME                    READY   STATUS    RESTARTS   AGE
green-fd57ffc44-bmb9b   1/1     Running   0          18m
green-fd57ffc44-cpd78   1/1     Running   0          18m
green-fd57ffc44-dfphw   1/1     Running   0          18m
green-fd57ffc44-hhkd4   1/1     Running   0          21m
green-fd57ffc44-hwphs   1/1     Running   0          33m
green-fd57ffc44-mg5bl   1/1     Running   0          18m
green-fd57ffc44-np84q   1/1     Running   0          18m
green-fd57ffc44-sld4p   1/1     Running   0          10m
green-fd57ffc44-tmtgl   1/1     Running   0          18m
green-fd57ffc44-v58fq   1/1     Running   0          18m
green-fd57ffc44-wcv9x   1/1     Running   0          18m
afour@A4G354-PCUbuntu:~$ k get deploy
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
green   10/10   10           10          33m
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k edit deploy green
deployment.apps/green edited
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po
NAME                    READY   STATUS        RESTARTS   AGE
green-fd57ffc44-bmb9b   1/1     Running       0          18m
green-fd57ffc44-cpd78   0/1     Terminating   0          18m
green-fd57ffc44-dfphw   0/1     Terminating   0          18m
green-fd57ffc44-hhkd4   1/1     Running       0          22m
green-fd57ffc44-hwphs   1/1     Running       0          33m
green-fd57ffc44-mg5bl   1/1     Terminating   0          18m
green-fd57ffc44-np84q   0/1     Terminating   0          18m
green-fd57ffc44-sld4p   1/1     Terminating   0          11m
green-fd57ffc44-tmtgl   0/1     Terminating   0          18m
green-fd57ffc44-v58fq   1/1     Terminating   0          18m
green-fd57ffc44-wcv9x   1/1     Terminating   0          18m
afour@A4G354-PCUbuntu:~$ k get po
NAME                    READY   STATUS        RESTARTS   AGE
green-fd57ffc44-bmb9b   1/1     Running       0          18m
green-fd57ffc44-cpd78   0/1     Terminating   0          18m
green-fd57ffc44-dfphw   0/1     Terminating   0          18m
green-fd57ffc44-hhkd4   1/1     Running       0          22m
green-fd57ffc44-hwphs   1/1     Running       0          34m
green-fd57ffc44-mg5bl   0/1     Terminating   0          18m
green-fd57ffc44-np84q   0/1     Terminating   0          18m
green-fd57ffc44-sld4p   0/1     Terminating   0          11m
green-fd57ffc44-tmtgl   0/1     Terminating   0          18m
green-fd57ffc44-v58fq   0/1     Terminating   0          18m
green-fd57ffc44-wcv9x   0/1     Terminating   0          18m
afour@A4G354-PCUbuntu:~$ k get po
NAME                    READY   STATUS        RESTARTS   AGE
green-fd57ffc44-bmb9b   1/1     Running       0          18m
green-fd57ffc44-cpd78   0/1     Terminating   0          18m
green-fd57ffc44-dfphw   0/1     Terminating   0          18m
green-fd57ffc44-hhkd4   1/1     Running       0          22m
green-fd57ffc44-hwphs   1/1     Running       0          34m
green-fd57ffc44-mg5bl   0/1     Terminating   0          18m
green-fd57ffc44-np84q   0/1     Terminating   0          18m
green-fd57ffc44-sld4p   0/1     Terminating   0          11m
green-fd57ffc44-tmtgl   0/1     Terminating   0          18m
green-fd57ffc44-v58fq   0/1     Terminating   0          18m
green-fd57ffc44-wcv9x   0/1     Terminating   0          18m
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po
NAME                    READY   STATUS        RESTARTS   AGE
green-fd57ffc44-bmb9b   1/1     Running       0          18m
green-fd57ffc44-hhkd4   1/1     Running       0          22m
green-fd57ffc44-hwphs   1/1     Running       0          34m
green-fd57ffc44-mg5bl   0/1     Terminating   0          18m
green-fd57ffc44-np84q   0/1     Terminating   0          18m
green-fd57ffc44-sld4p   0/1     Terminating   0          11m
green-fd57ffc44-v58fq   0/1     Terminating   0          18m
green-fd57ffc44-wcv9x   0/1     Terminating   0          18m
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ kd po green-fd57ffc44-bmb9b
Name:         green-fd57ffc44-bmb9b
Namespace:    default
Priority:     0
Node:         kind-control-plane/172.18.0.4
Start Time:   Wed, 02 Dec 2020 19:42:05 +0530
Labels:       app=yellow
              pod-template-hash=fd57ffc44
Annotations:  <none>
Status:       Running
IP:           10.244.0.8
IPs:
  IP:  10.244.0.8
Containers:
  nginx:
    Container ID:   containerd://626419d898c862259620bfb67cf79cf6523517a3d0a552d7cc48f37276801a12
    Image:          nginx
    Image ID:       docker.io/library/nginx@sha256:6b1daa9462046581ac15be20277a7c75476283f969cb3a61c8725ec38d3b01c3
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Wed, 02 Dec 2020 19:42:38 +0530
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-hwpn4 (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  default-token-hwpn4:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  default-token-hwpn4
    Optional:    false
QoS Class:       BestEffort
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                 node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  18m   default-scheduler  Successfully assigned default/green-fd57ffc44-bmb9b to kind-control-plane
  Normal  Pulling    18m   kubelet            Pulling image "nginx"
  Normal  Pulled     18m   kubelet            Successfully pulled image "nginx" in 30.720123171s
  Normal  Created    18m   kubelet            Created container nginx
  Normal  Started    18m   kubelet            Started container nginx
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k get po
NAME                    READY   STATUS    RESTARTS   AGE
green-fd57ffc44-bmb9b   1/1     Running   0          20m
green-fd57ffc44-hhkd4   1/1     Running   0          23m
green-fd57ffc44-hwphs   1/1     Running   0          35m
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ k exec -it green-fd57ffc44-bmb9b /bin/bash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
root@green-fd57ffc44-bmb9b:/# 
root@green-fd57ffc44-bmb9b:/# 
root@green-fd57ffc44-bmb9b:/# 
root@green-fd57ffc44-bmb9b:/# pwd  
/
root@green-fd57ffc44-bmb9b:/# ls -lrta /etc/
total 324
-rw-r--r-- 1 root root       9 Aug  7  2006 host.conf
-rw-r--r-- 1 root root     767 Mar  4  2016 profile
-rw-r--r-- 1 root root     604 Jun 26  2016 deluser.conf
-rw-r--r-- 1 root root      34 Mar  2  2018 ld.so.conf
-rw-r--r-- 1 root root     367 Mar  2  2018 bindresvport.blacklist
-rw-r--r-- 1 root root    1748 May  5  2018 inputrc
-rw-r--r-- 1 root root    4141 Jul 27  2018 securetty
-rw-r--r-- 1 root root   10477 Jul 27  2018 login.defs
-rw-r--r-- 1 root root    2584 Aug  1  2018 gai.conf
drwxr-xr-x 1 root root    4096 Dec  3  2018 systemd
-rw-r--r-- 1 root root    1260 Dec 14  2018 ucf.conf
-rw-r--r-- 1 root root     494 Feb 10  2019 nsswitch.conf
-rw-r--r-- 1 root root     552 Feb 14  2019 pam.conf
-rw-r--r-- 1 root root    2969 Feb 26  2019 debconf.conf
-rw-r--r-- 1 root root     642 Mar  1  2019 xattr.conf
-rw-r--r-- 1 root root    1994 Apr 18  2019 bash.bashrc
lrwxrwxrwx 1 root root      13 Apr 23  2019 rmt -> /usr/sbin/rmt
-rw-r--r-- 1 root root     191 Apr 25  2019 libaudit.conf
-rw-r--r-- 1 root root     812 Jan 10  2020 mke2fs.conf
drwxr-xr-x 3 root root    4096 May 12  2020 kernel
drwxr-xr-x 2 root root    4096 Sep 19 21:39 profile.d
lrwxrwxrwx 1 root root      21 Sep 19 21:39 os-release -> ../usr/lib/os-release
-rw-r--r-- 1 root root     286 Sep 19 21:39 motd
-rw-r--r-- 1 root root      20 Sep 19 21:39 issue.net
-rw-r--r-- 1 root root      27 Sep 19 21:39 issue
-rw-r--r-- 1 root root       5 Sep 19 21:39 debian_version
drwxr-xr-x 2 root root    4096 Nov 17 00:00 update-motd.d
-rw-r--r-- 1 root root       8 Nov 17 00:00 timezone
drwxr-xr-x 2 root root    4096 Nov 17 00:00 terminfo
-rw-r--r-- 1 root root       0 Nov 17 00:00 subuid
-rw-r--r-- 1 root root       0 Nov 17 00:00 subgid
drwxr-xr-x 2 root root    4096 Nov 17 00:00 skel
-rw-r--r-- 1 root root      73 Nov 17 00:00 shells
drwxr-xr-x 2 root root    4096 Nov 17 00:00 selinux
drwxr-xr-x 4 root root    4096 Nov 17 00:00 security
drwxr-xr-x 2 root root    4096 Nov 17 00:00 rcS.d
drwxr-xr-x 2 root root    4096 Nov 17 00:00 pam.d
drwxr-xr-x 2 root root    4096 Nov 17 00:00 opt
-rw-r--r-- 1 root root      33 Nov 17 00:00 machine-id
lrwxrwxrwx 1 root root      27 Nov 17 00:00 localtime -> /usr/share/zoneinfo/Etc/UTC
drwxr-xr-x 2 root root    4096 Nov 17 00:00 ld.so.conf.d
-rw-r----- 1 root shadow   374 Nov 17 00:00 gshadow-
-rw-r--r-- 1 root root     446 Nov 17 00:00 group-
-rw-r--r-- 1 root root      37 Nov 17 00:00 fstab
-rw-r--r-- 1 root root       0 Nov 17 00:00 environment
drwxr-xr-x 4 root root    4096 Nov 17 00:00 dpkg
drwxr-xr-x 2 root root    4096 Nov 17 00:00 cron.daily
drwxr-xr-x 2 root root    4096 Nov 17 00:00 alternatives
-rw-r--r-- 1 root root    2981 Nov 17 00:00 adduser.conf
-rw------- 1 root root       0 Nov 17 00:00 .pwd.lock
-rw-r----- 1 root shadow   528 Nov 25 00:29 shadow-
-rw-r----- 1 root shadow   528 Nov 25 00:29 shadow
-rw-r--r-- 1 root root     967 Nov 25 00:29 passwd-
-rw-r--r-- 1 root root     980 Nov 25 00:29 passwd
-rw-r----- 1 root shadow   384 Nov 25 00:29 gshadow
-rw-r--r-- 1 root root     459 Nov 25 00:29 group
drwxr-xr-x 3 root root    4096 Nov 25 00:30 ca-certificates
drwxr-xr-x 4 root root    4096 Nov 25 00:30 ssl
-rw-r--r-- 1 root root    5434 Nov 25 00:30 ca-certificates.conf
drwxr-xr-x 1 root root    4096 Nov 25 00:30 apt
drwxr-xr-x 3 root root    4096 Nov 25 00:30 gss
drwxr-xr-x 1 root root    4096 Nov 25 00:30 rc6.d
drwxr-xr-x 1 root root    4096 Nov 25 00:30 rc5.d
drwxr-xr-x 1 root root    4096 Nov 25 00:30 rc4.d
drwxr-xr-x 1 root root    4096 Nov 25 00:30 rc3.d
drwxr-xr-x 1 root root    4096 Nov 25 00:30 rc2.d
drwxr-xr-x 1 root root    4096 Nov 25 00:30 rc1.d
drwxr-xr-x 1 root root    4096 Nov 25 00:30 rc0.d
drwxr-xr-x 1 root root    4096 Nov 25 00:30 nginx
drwxr-xr-x 1 root root    4096 Nov 25 00:30 logrotate.d
drwxr-xr-x 2 root root    4096 Nov 25 00:30 ldap
drwxr-xr-x 1 root root    4096 Nov 25 00:30 init.d
drwxr-xr-x 1 root root    4096 Nov 25 00:30 default
-rw-r--r-- 1 root root   10670 Nov 25 00:30 ld.so.cache
drwxr-xr-x 4 root root    4096 Nov 25 00:30 fonts
-rw-r--r-- 1 root root     103 Dec  2 14:12 resolv.conf
-rw-r--r-- 1 root root      22 Dec  2 14:12 hostname
-rw-r--r-- 1 root root     216 Dec  2 14:12 hosts
drwxr-xr-x 1 root root    4096 Dec  2 14:12 ..
drwxr-xr-x 1 root root    4096 Dec  2 14:12 .
root@green-fd57ffc44-bmb9b:/# 
root@green-fd57ffc44-bmb9b:/# 
root@green-fd57ffc44-bmb9b:/# 
root@green-fd57ffc44-bmb9b:/# 
root@green-fd57ffc44-bmb9b:/# find / -iname nginx
/etc/default/nginx
/etc/init.d/nginx
/etc/logrotate.d/nginx
/etc/nginx
/usr/share/doc/nginx
/usr/share/nginx
/usr/sbin/nginx
/usr/lib/nginx
find: '/proc/29/map_files': Permission denied
/var/log/nginx
/var/cache/nginx
root@green-fd57ffc44-bmb9b:/# 
root@green-fd57ffc44-bmb9b:/# 
root@green-fd57ffc44-bmb9b:/# find / -iname index.html
/usr/share/nginx/html/index.html
find: '/proc/29/map_files': Permission denied
root@green-fd57ffc44-bmb9b:/# 
root@green-fd57ffc44-bmb9b:/# 
root@green-fd57ffc44-bmb9b:/# 
root@green-fd57ffc44-bmb9b:/# vi /usr/share/nginx/html/index.html
bash: vi: command not found
root@green-fd57ffc44-bmb9b:/# cat /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
root@green-fd57ffc44-bmb9b:/# exit
exit
afour@A4G354-PCUbuntu:~$ k get po
NAME                    READY   STATUS    RESTARTS   AGE
green-fd57ffc44-bmb9b   1/1     Running   0          22m
green-fd57ffc44-hhkd4   1/1     Running   0          26m
green-fd57ffc44-hwphs   1/1     Running   0          37m
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ 
afour@A4G354-PCUbuntu:~$ cd temp/
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ touch index.html
afour@A4G354-PCUbuntu:~/temp$ vi index.html 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k create configmap green-cm --from-file=index.html --dry-run=client 
configmap/green-cm created (dry run)
afour@A4G354-PCUbuntu:~/temp$ k create configmap green-cm --from-file=index.html --dry-run=client -o yaml
apiVersion: v1
data:
  index.html: |
    <p>Hello Green</p>
kind: ConfigMap
metadata:
  creationTimestamp: null
  name: green-cm
afour@A4G354-PCUbuntu:~/temp$ k create configmap green-cm --from-file=index.html --dry-run=client -o yaml > green-cm.yaml
afour@A4G354-PCUbuntu:~/temp$ cat green-cm.yaml 
apiVersion: v1
data:
  index.html: |
    <p>Hello Green</p>
kind: ConfigMap
metadata:
  creationTimestamp: null
  name: green-cm
afour@A4G354-PCUbuntu:~/temp$ k create -f green-cm.yaml 
configmap/green-cm created
afour@A4G354-PCUbuntu:~/temp$ k get cm
NAME       DATA   AGE
green-cm   1      3s
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ kd cm green-cm
Name:         green-cm
Namespace:    default
Labels:       <none>
Annotations:  <none>

Data
====
index.html:
----
<p>Hello Green</p>

Events:  <none>
afour@A4G354-PCUbuntu:~/temp$ k get deploy
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
green   2/2     2            2           41m
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ vi ../green
green-svc.yaml  green.yaml      
afour@A4G354-PCUbuntu:~/temp$ vi ../green.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ vi ../green.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k replace -f ../green.yaml 
deployment.apps/green replaced
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ ll
total 40552
drwxr-xr-x  2 afour afour     4096 Dec  2 20:07 ./
drwxr-xr-x 36 afour afour     4096 Dec  2 20:12 ../
-rw-r--r--  1 afour afour 41496528 Nov 28 13:00 amazon-ssm-agent.deb
-rw-r--r--  1 afour afour     7594 Nov 13 16:36 bashrc
-rw-r--r--  1 afour afour      129 Dec  2 20:07 green-cm.yaml
-rw-r--r--  1 afour afour       19 Dec  2 20:05 index.html
afour@A4G354-PCUbuntu:~/temp$ k get cm
NAME       DATA   AGE
green-cm   1      6m32s
afour@A4G354-PCUbuntu:~/temp$ kd cm green-cm
Name:         green-cm
Namespace:    default
Labels:       <none>
Annotations:  <none>

Data
====
index.html:
----
<p>Hello Green</p>

Events:  <none>
afour@A4G354-PCUbuntu:~/temp$ ll
total 40552
drwxr-xr-x  2 afour afour     4096 Dec  2 20:07 ./
drwxr-xr-x 36 afour afour     4096 Dec  2 20:12 ../
-rw-r--r--  1 afour afour 41496528 Nov 28 13:00 amazon-ssm-agent.deb
-rw-r--r--  1 afour afour     7594 Nov 13 16:36 bashrc
-rw-r--r--  1 afour afour      129 Dec  2 20:07 green-cm.yaml
-rw-r--r--  1 afour afour       19 Dec  2 20:05 index.html
afour@A4G354-PCUbuntu:~/temp$ vi green-cm.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ cat green-cm.yaml > yellow-cm.yaml
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ vi yellow-cm.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k create -f yellow-cm.yaml 
configmap/yellow-cm created
afour@A4G354-PCUbuntu:~/temp$ k get cm
NAME        DATA   AGE
green-cm    1      8m47s
yellow-cm   1      2s
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ vi ../
.aws/                      Documents/                 .java/                     .npm-global/               .ssh/
awscli-bundle/             Downloads/                 .kube/                     .npmrc                     .sudo_as_admin_successful
awscli-bundle.zip          examples.desktop           kustomize                  Pictures/                  tan/
.bash_history              get-pip.py                 .local/                    .pki/                      temp/
.bash_logout               .gnome/                    .mozilla/                  .profile                   Templates/
.bashrc                    .gnupg/                    Music/                     Public/                    .thunderbird/
.cache/                    go/                        .mysql/                    .qt/                       Videos/
.config/                   green-svc.yaml             .mysql_history             .serverless/               vmware/
Desktop/                   green.yaml                 .node_repl_history         .serverlessrc              .vmware/
.docker/                   .ICEauthority              .npm/                      snap/                      .vscode/
afour@A4G354-PCUbuntu:~/temp$ vi ../g
get-pip.py      go/             green-svc.yaml  green.yaml      
afour@A4G354-PCUbuntu:~/temp$ vi ../green
green-svc.yaml  green.yaml      
afour@A4G354-PCUbuntu:~/temp$ vi ../green.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k replace -f ../green.yaml 
The Deployment "green" is invalid: spec.template.spec.containers[0].volumeMounts[1].mountPath: Invalid value: "/usr/share/nginx/html": must be unique
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ vi ../green.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ ll
total 40556
drwxr-xr-x  2 afour afour     4096 Dec  2 20:15 ./
drwxr-xr-x 36 afour afour     4096 Dec  2 20:18 ../
-rw-r--r--  1 afour afour 41496528 Nov 28 13:00 amazon-ssm-agent.deb
-rw-r--r--  1 afour afour     7594 Nov 13 16:36 bashrc
-rw-r--r--  1 afour afour      129 Dec  2 20:07 green-cm.yaml
-rw-r--r--  1 afour afour       19 Dec  2 20:05 index.html
-rw-r--r--  1 afour afour      132 Dec  2 20:15 yellow-cm.yaml
afour@A4G354-PCUbuntu:~/temp$ vi green-cm.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k create configmap green-cm --from-file=index.html --from-file=yellow.html --dry-run=client -o yaml > green-cm.yaml
error: error reading yellow.html: no such file or directory
afour@A4G354-PCUbuntu:~/temp$ ll
total 40552
drwxr-xr-x  2 afour afour     4096 Dec  2 20:18 ./
drwxr-xr-x 36 afour afour     4096 Dec  2 20:18 ../
-rw-r--r--  1 afour afour 41496528 Nov 28 13:00 amazon-ssm-agent.deb
-rw-r--r--  1 afour afour     7594 Nov 13 16:36 bashrc
-rw-r--r--  1 afour afour        0 Dec  2 20:19 green-cm.yaml
-rw-r--r--  1 afour afour       19 Dec  2 20:05 index.html
-rw-r--r--  1 afour afour      132 Dec  2 20:15 yellow-cm.yaml
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ vi yellow-cm.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ cat yellow-cm.yaml 
apiVersion: v1
data:
  yellow.html: |
    <p>Hello Yellow</p>
kind: ConfigMap
metadata:
  creationTimestamp: null
  name: yellow-cm
afour@A4G354-PCUbuntu:~/temp$ cat index.html > yellow.htlm
afour@A4G354-PCUbuntu:~/temp$ cat yellow
cat: yellow: No such file or directory
afour@A4G354-PCUbuntu:~/temp$ cat yellow.htlm 
<p>Hello Green</p>
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k create configmap green-cm --from-file=index.html --from-file=yellow.html --dry-run=client -o yaml > green-cm.yaml
error: error reading yellow.html: no such file or directory
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k create configmap green-cm --from-file=index.html --from-file=yellow.html --dry-run=client -o yaml > green-cm.yaml
error: error reading yellow.html: no such file or directory
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ mv yellow.htlm yellow.html
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k create configmap green-cm --from-file=index.html --from-file=yellow.html --dry-run=client -o yaml > green-cm.yaml
afour@A4G354-PCUbuntu:~/temp$ k get cm
NAME        DATA   AGE
green-cm    1      13m
yellow-cm   1      4m37s
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ kd cm green-cm
Name:         green-cm
Namespace:    default
Labels:       <none>
Annotations:  <none>

Data
====
index.html:
----
<p>Hello Green</p>

Events:  <none>
afour@A4G354-PCUbuntu:~/temp$ k create -f green-cm.yaml 
Error from server (AlreadyExists): error when creating "green-cm.yaml": configmaps "green-cm" already exists
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ vi green-cm.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k replace -f green-cm.yaml 
configmap/green-cm replaced
afour@A4G354-PCUbuntu:~/temp$ k get cm
NAME        DATA   AGE
green-cm    2      14m
yellow-cm   1      5m42s
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ kd cm green-cm
Name:         green-cm
Namespace:    default
Labels:       <none>
Annotations:  <none>

Data
====
index.html:
----
<p>Hello Green</p>

yellow.html:
----
<p>Hello Green</p>

Events:  <none>
afour@A4G354-PCUbuntu:~/temp$ vi yellow.html 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ kd cm green-cm
Name:         green-cm
Namespace:    default
Labels:       <none>
Annotations:  <none>

Data
====
index.html:
----
<p>Hello Green</p>

yellow.html:
----
<p>Hello Green</p>

Events:  <none>
afour@A4G354-PCUbuntu:~/temp$ kd cm green-cm
Name:         green-cm
Namespace:    default
Labels:       <none>
Annotations:  <none>

Data
====
index.html:
----
<p>Hello Green</p>

yellow.html:
----
<p>Hello Green</p>

Events:  <none>
afour@A4G354-PCUbuntu:~/temp$ k replace -f green-cm.yaml 
configmap/green-cm replaced
afour@A4G354-PCUbuntu:~/temp$ kd cm green-cm
Name:         green-cm
Namespace:    default
Labels:       <none>
Annotations:  <none>

Data
====
index.html:
----
<p>Hello Green</p>

yellow.html:
----
<p>Hello Green</p>

Events:  <none>
afour@A4G354-PCUbuntu:~/temp$ k create configmap green-cm --from-file=index.html --from-file=yellow.html --dry-run=client -o yaml > green-cm.yaml
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k replace -f green-cm.yaml 
configmap/green-cm replaced
afour@A4G354-PCUbuntu:~/temp$ kd cm green-cm
Name:         green-cm
Namespace:    default
Labels:       <none>
Annotations:  <none>

Data
====
index.html:
----
<p>Hello Green</p>

yellow.html:
----
<p>Hello Yellow</p>

Events:  <none>
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k create configmap green-cm-1 --from-literal=http-port=80 --dry-run=client -o yaml > green-cm-1.yaml
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ cat green-cm-1.yaml 
apiVersion: v1
data:
  http-port: "80"
kind: ConfigMap
metadata:
  creationTimestamp: null
  name: green-cm-1
afour@A4G354-PCUbuntu:~/temp$ vi ../green.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ vi ../green.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ vi ../green.yaml 
afour@A4G354-PCUbuntu:~/temp$ vi ../green.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k replace -f ../green.yaml 
error: error validating "../green.yaml": error validating data: ValidationError(Deployment.spec.template.spec.containers[0].env): invalid type for io.k8s.api.core.v1.Container.env: got "map", expected "array"; if you choose to ignore these errors, turn validation off with --validate=false
afour@A4G354-PCUbuntu:~/temp$ mv ../green.yaml .
afour@A4G354-PCUbuntu:~/temp$ vi green.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k replace -f ../green.yaml 
error: the path "../green.yaml" does not exist
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k replace -f green.yaml 
error: error validating "green.yaml": error validating data: ValidationError(Deployment.spec.template.spec.containers[0].env[0].valueFrom.configMapKeyRef): missing required field "key" in io.k8s.api.core.v1.ConfigMapKeySelector; if you choose to ignore these errors, turn validation off with --validate=false
afour@A4G354-PCUbuntu:~/temp$ vi green.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ ll
total 40568
drwxr-xr-x  2 afour afour     4096 Dec  2 20:35 ./
drwxr-xr-x 36 afour afour     4096 Dec  2 20:33 ../
-rw-r--r--  1 afour afour 41496528 Nov 28 13:00 amazon-ssm-agent.deb
-rw-r--r--  1 afour afour     7594 Nov 13 16:36 bashrc
-rw-r--r--  1 afour afour      110 Dec  2 20:26 green-cm-1.yaml
-rw-r--r--  1 afour afour      170 Dec  2 20:22 green-cm.yaml
-rw-r--r--  1 afour afour      699 Dec  2 20:34 green.yaml
-rw-r--r--  1 afour afour       19 Dec  2 20:05 index.html
-rw-r--r--  1 afour afour      132 Dec  2 20:15 yellow-cm.yaml
-rw-r--r--  1 afour afour       20 Dec  2 20:22 yellow.html
afour@A4G354-PCUbuntu:~/temp$ cat green-cm-1.yaml 
apiVersion: v1
data:
  http-port: "80"
kind: ConfigMap
metadata:
  creationTimestamp: null
  name: green-cm-1
afour@A4G354-PCUbuntu:~/temp$ vi green.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k replace -f green.yaml 
deployment.apps/green replaced
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k get deploy
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
green   2/2     1            2           69m
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ kd deploy green
Name:                   green
Namespace:              default
CreationTimestamp:      Wed, 02 Dec 2020 19:26:38 +0530
Labels:                 app=green
Annotations:            deployment.kubernetes.io/revision: 3
Selector:               app=green
Replicas:               2 desired | 1 updated | 3 total | 2 available | 1 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=green
  Containers:
   nginx:
    Image:      nginx
    Port:       80/TCP
    Host Port:  0/TCP
    Environment:
      port-num:  <set to the key 'http-port' of config map 'green-cm-1'>  Optional: false
    Mounts:
      /usr/share/nginx/html from green-vol (rw)
  Volumes:
   green-vol:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      green-cm
    Optional:  false
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    ReplicaSetUpdated
OldReplicaSets:  green-5fc8b9cf5b (2/2 replicas created)
NewReplicaSet:   green-5f6cb677bf (1/1 replicas created)
Events:
  Type    Reason             Age   From                   Message
  ----    ------             ----  ----                   -------
  Normal  ScalingReplicaSet  54m   deployment-controller  Scaled up replica set green-fd57ffc44 to 10
  Normal  ScalingReplicaSet  35m   deployment-controller  Scaled down replica set green-fd57ffc44 to 2
  Normal  ScalingReplicaSet  23m   deployment-controller  Scaled up replica set green-5fc8b9cf5b to 1
  Normal  ScalingReplicaSet  23m   deployment-controller  Scaled down replica set green-fd57ffc44 to 1
  Normal  ScalingReplicaSet  23m   deployment-controller  Scaled up replica set green-5fc8b9cf5b to 2
  Normal  ScalingReplicaSet  23m   deployment-controller  Scaled down replica set green-fd57ffc44 to 0
  Normal  ScalingReplicaSet  24s   deployment-controller  Scaled up replica set green-5f6cb677bf to 1
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k get p
^C
afour@A4G354-PCUbuntu:~/temp$ k get po
NAME                     READY   STATUS                       RESTARTS   AGE
green-5f6cb677bf-xtzsh   0/1     CreateContainerConfigError   0          44s
green-5fc8b9cf5b-brhrl   1/1     Running                      0          24m
green-5fc8b9cf5b-wx6x5   1/1     Running                      0          23m
green-fd57ffc44-bmb9b    1/1     Running                      0          54m
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k exec -it green-5fc8b9cf5b-brhrl --env
Error: unknown flag: --env
See 'kubectl exec --help' for usage.
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k exec -it green-5fc8b9cf5b-brhrl /bin/bash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
root@green-5fc8b9cf5b-brhrl:/# 
root@green-5fc8b9cf5b-brhrl:/# 
root@green-5fc8b9cf5b-brhrl:/# 
root@green-5fc8b9cf5b-brhrl:/# env
KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_SERVICE_PORT=443
HOSTNAME=green-5fc8b9cf5b-brhrl
PWD=/
GREEN_SVC_SERVICE_HOST=10.96.36.187
PKG_RELEASE=1~buster
HOME=/root
GREEN_SVC_PORT=tcp://10.96.36.187:80
KUBERNETES_PORT_443_TCP=tcp://10.96.0.1:443
GREEN_SVC_SERVICE_PORT=80
GREEN_SVC_PORT_80_TCP=tcp://10.96.36.187:80
GREEN_SVC_PORT_80_TCP_PORT=80
NJS_VERSION=0.4.4
TERM=xterm
GREEN_SVC_PORT_80_TCP_PROTO=tcp
SHLVL=1
GREEN_SVC_PORT_80_TCP_ADDR=10.96.36.187
KUBERNETES_PORT_443_TCP_PROTO=tcp
GREEN_SVC_SERVICE_PORT_GREEN_PORT=80
KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
KUBERNETES_SERVICE_HOST=10.96.0.1
KUBERNETES_PORT=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP_PORT=443
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
NGINX_VERSION=1.19.5
_=/usr/bin/env
root@green-5fc8b9cf5b-brhrl:/# env | grep -i port
KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_SERVICE_PORT=443
GREEN_SVC_PORT=tcp://10.96.36.187:80
KUBERNETES_PORT_443_TCP=tcp://10.96.0.1:443
GREEN_SVC_SERVICE_PORT=80
GREEN_SVC_PORT_80_TCP=tcp://10.96.36.187:80
GREEN_SVC_PORT_80_TCP_PORT=80
GREEN_SVC_PORT_80_TCP_PROTO=tcp
GREEN_SVC_PORT_80_TCP_ADDR=10.96.36.187
KUBERNETES_PORT_443_TCP_PROTO=tcp
GREEN_SVC_SERVICE_PORT_GREEN_PORT=80
KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
KUBERNETES_PORT=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP_PORT=443
root@green-5fc8b9cf5b-brhrl:/# 
root@green-5fc8b9cf5b-brhrl:/# 
root@green-5fc8b9cf5b-brhrl:/# env | grep -i http-port
root@green-5fc8b9cf5b-brhrl:/# exit
exit
command terminated with exit code 1
afour@A4G354-PCUbuntu:~/temp$ k get po
NAME                     READY   STATUS                       RESTARTS   AGE
green-5f6cb677bf-xtzsh   0/1     CreateContainerConfigError   0          98s
green-5fc8b9cf5b-brhrl   1/1     Running                      0          24m
green-5fc8b9cf5b-wx6x5   1/1     Running                      0          24m
green-fd57ffc44-bmb9b    1/1     Running                      0          55m
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k logs CreateContainerConfigError
Error from server (NotFound): pods "CreateContainerConfigError" not found
afour@A4G354-PCUbuntu:~/temp$ k logs green-5f6cb677bf-xtzsh
Error from server (BadRequest): container "nginx" in pod "green-5f6cb677bf-xtzsh" is waiting to start: CreateContainerConfigError
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ kd pod green-5f6cb677bf-xtzsh
Name:         green-5f6cb677bf-xtzsh
Namespace:    default
Priority:     0
Node:         kind-worker/172.18.0.2
Start Time:   Wed, 02 Dec 2020 20:35:56 +0530
Labels:       app=green
              pod-template-hash=5f6cb677bf
Annotations:  <none>
Status:       Pending
IP:           10.244.2.9
IPs:
  IP:           10.244.2.9
Controlled By:  ReplicaSet/green-5f6cb677bf
Containers:
  nginx:
    Container ID:   
    Image:          nginx
    Image ID:       
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Waiting
      Reason:       CreateContainerConfigError
    Ready:          False
    Restart Count:  0
    Environment:
      port-num:  <set to the key 'http-port' of config map 'green-cm-1'>  Optional: false
    Mounts:
      /usr/share/nginx/html from green-vol (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-hwpn4 (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             False 
  ContainersReady   False 
  PodScheduled      True 
Volumes:
  green-vol:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      green-cm
    Optional:  false
  default-token-hwpn4:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  default-token-hwpn4
    Optional:    false
QoS Class:       BestEffort
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                 node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                 From               Message
  ----     ------     ----                ----               -------
  Normal   Scheduled  2m4s                default-scheduler  Successfully assigned default/green-5f6cb677bf-xtzsh to kind-worker
  Normal   Pulled     2m                  kubelet            Successfully pulled image "nginx" in 2.871468333s
  Normal   Pulled     117s                kubelet            Successfully pulled image "nginx" in 2.761438814s
  Normal   Pulled     103s                kubelet            Successfully pulled image "nginx" in 2.516028537s
  Normal   Pulled     88s                 kubelet            Successfully pulled image "nginx" in 2.728726984s
  Normal   Pulled     70s                 kubelet            Successfully pulled image "nginx" in 3.315929392s
  Normal   Pulled     57s                 kubelet            Successfully pulled image "nginx" in 2.597856706s
  Normal   Pulled     41s                 kubelet            Successfully pulled image "nginx" in 3.540108671s
  Warning  Failed     22s (x8 over 2m)    kubelet            Error: configmap "green-cm-1" not found
  Normal   Pulled     22s                 kubelet            Successfully pulled image "nginx" in 4.091352805s
  Normal   Pulling    10s (x9 over 2m3s)  kubelet            Pulling image "nginx"
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k get cm
NAME        DATA   AGE
green-cm    2      30m
yellow-cm   1      22m
afour@A4G354-PCUbuntu:~/temp$ cat green-cm-1.yaml 
apiVersion: v1
data:
  http-port: "80"
kind: ConfigMap
metadata:
  creationTimestamp: null
  name: green-cm-1
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k create -f green-cm-1.yaml 
configmap/green-cm-1 created
afour@A4G354-PCUbuntu:~/temp$ k get po
NAME                     READY   STATUS                       RESTARTS   AGE
green-5f6cb677bf-xtzsh   0/1     CreateContainerConfigError   0          2m41s
green-5fc8b9cf5b-brhrl   1/1     Running                      0          25m
green-5fc8b9cf5b-wx6x5   1/1     Running                      0          25m
green-fd57ffc44-bmb9b    1/1     Running                      0          56m
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k get po -w
NAME                     READY   STATUS    RESTARTS   AGE
green-5f6cb677bf-xtzsh   1/1     Running   0          2m43s
green-5fc8b9cf5b-brhrl   1/1     Running   0          25m
green-5fc8b9cf5b-wx6x5   1/1     Running   0          25m
green-fd57ffc44-bmb9b    1/1     Running   0          56m
green-5fc8b9cf5b-brhrl   1/1     Terminating   0          26m
green-5f6cb677bf-gsvwz   0/1     Pending       0          0s
green-5f6cb677bf-gsvwz   0/1     Pending       0          0s
green-5f6cb677bf-gsvwz   0/1     ContainerCreating   0          1s
green-5fc8b9cf5b-brhrl   0/1     Terminating         0          26m
green-5fc8b9cf5b-brhrl   0/1     Terminating         0          26m
green-5fc8b9cf5b-brhrl   0/1     Terminating         0          26m
green-5f6cb677bf-gsvwz   1/1     Running             0          6s
green-5fc8b9cf5b-wx6x5   1/1     Terminating         0          26m
green-5fc8b9cf5b-wx6x5   0/1     Terminating         0          26m




^Cafour@A4G354-PCUbuntu:~/temp$ k get po 
NAME                     READY   STATUS        RESTARTS   AGE
green-5f6cb677bf-gsvwz   1/1     Running       0          15s
green-5f6cb677bf-xtzsh   1/1     Running       0          2m59s
green-5fc8b9cf5b-wx6x5   0/1     Terminating   0          26m
green-fd57ffc44-bmb9b    1/1     Running       0          56m
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k get po 
NAME                     READY   STATUS    RESTARTS   AGE
green-5f6cb677bf-gsvwz   1/1     Running   0          18s
green-5f6cb677bf-xtzsh   1/1     Running   0          3m2s
green-fd57ffc44-bmb9b    1/1     Running   0          56m
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k exec -it green-5f6cb677bf-gsvwz /bin/bash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
root@green-5f6cb677bf-gsvwz:/# 
root@green-5f6cb677bf-gsvwz:/# 
root@green-5f6cb677bf-gsvwz:/# 
root@green-5f6cb677bf-gsvwz:/# env | grep http-ort
root@green-5f6cb677bf-gsvwz:/# env | grep http-port
root@green-5f6cb677bf-gsvwz:/# env                 
port-num=80
KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_SERVICE_PORT=443
HOSTNAME=green-5f6cb677bf-gsvwz
PWD=/
GREEN_SVC_SERVICE_HOST=10.96.36.187
PKG_RELEASE=1~buster
HOME=/root
GREEN_SVC_PORT=tcp://10.96.36.187:80
KUBERNETES_PORT_443_TCP=tcp://10.96.0.1:443
GREEN_SVC_SERVICE_PORT=80
GREEN_SVC_PORT_80_TCP=tcp://10.96.36.187:80
GREEN_SVC_PORT_80_TCP_PORT=80
NJS_VERSION=0.4.4
TERM=xterm
GREEN_SVC_PORT_80_TCP_PROTO=tcp
SHLVL=1
GREEN_SVC_PORT_80_TCP_ADDR=10.96.36.187
KUBERNETES_PORT_443_TCP_PROTO=tcp
GREEN_SVC_SERVICE_PORT_GREEN_PORT=80
KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
KUBERNETES_SERVICE_HOST=10.96.0.1
KUBERNETES_PORT=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP_PORT=443
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
NGINX_VERSION=1.19.5
_=/usr/bin/env
root@green-5f6cb677bf-gsvwz:/# exit
exit
afour@A4G354-PCUbuntu:~/temp$ vi green.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k replace -f green.yaml 
deployment.apps/green replaced
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k get po
NAME                     READY   STATUS              RESTARTS   AGE
green-5f6cb677bf-gsvwz   1/1     Running             0          97s
green-5f6cb677bf-xtzsh   1/1     Running             0          4m21s
green-69f5846b8c-qwx7v   0/1     ContainerCreating   0          2s
green-fd57ffc44-bmb9b    1/1     Running             0          58m
afour@A4G354-PCUbuntu:~/temp$ k get po -w
NAME                     READY   STATUS              RESTARTS   AGE
green-5f6cb677bf-gsvwz   1/1     Running             0          100s
green-5f6cb677bf-xtzsh   1/1     Running             0          4m24s
green-69f5846b8c-qwx7v   0/1     ContainerCreating   0          5s
green-fd57ffc44-bmb9b    1/1     Running             0          58m
green-69f5846b8c-qwx7v   1/1     Running             0          6s
green-5f6cb677bf-xtzsh   1/1     Terminating         0          4m25s
green-69f5846b8c-xx78x   0/1     Pending             0          0s
green-69f5846b8c-xx78x   0/1     Pending             0          0s
green-69f5846b8c-xx78x   0/1     ContainerCreating   0          0s
green-5f6cb677bf-xtzsh   0/1     Terminating         0          4m27s
green-5f6cb677bf-xtzsh   0/1     Terminating         0          4m28s
green-5f6cb677bf-xtzsh   0/1     Terminating         0          4m28s
green-69f5846b8c-xx78x   1/1     Running             0          5s
green-5f6cb677bf-gsvwz   1/1     Terminating         0          106s
green-5f6cb677bf-gsvwz   0/1     Terminating         0          107s
green-5f6cb677bf-gsvwz   0/1     Terminating         0          108s
green-5f6cb677bf-gsvwz   0/1     Terminating         0          108s
^Cafour@A4G354-PCUbuntu:~/temp$ k get po 
NAME                     READY   STATUS    RESTARTS   AGE
green-69f5846b8c-qwx7v   1/1     Running   0          20s
green-69f5846b8c-xx78x   1/1     Running   0          14s
green-fd57ffc44-bmb9b    1/1     Running   0          58m
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ k exec -it green-69f5846b8c-qwx7v /bin/bash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
root@green-69f5846b8c-qwx7v:/# 
root@green-69f5846b8c-qwx7v:/# 
root@green-69f5846b8c-qwx7v:/# 
root@green-69f5846b8c-qwx7v:/# env | grep PORT
KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_SERVICE_PORT=443
PORT_NUM=80
GREEN_SVC_PORT=tcp://10.96.36.187:80
KUBERNETES_PORT_443_TCP=tcp://10.96.0.1:443
GREEN_SVC_SERVICE_PORT=80
GREEN_SVC_PORT_80_TCP=tcp://10.96.36.187:80
GREEN_SVC_PORT_80_TCP_PORT=80
GREEN_SVC_PORT_80_TCP_PROTO=tcp
GREEN_SVC_PORT_80_TCP_ADDR=10.96.36.187
KUBERNETES_PORT_443_TCP_PROTO=tcp
GREEN_SVC_SERVICE_PORT_GREEN_PORT=80
KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
KUBERNETES_PORT=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP_PORT=443
root@green-69f5846b8c-qwx7v:/# exit
exit
afour@A4G354-PCUbuntu:~/temp$ ll
total 40568
drwxr-xr-x  2 afour afour     4096 Dec  2 20:40 ./
drwxr-xr-x 36 afour afour     4096 Dec  2 20:33 ../
-rw-r--r--  1 afour afour 41496528 Nov 28 13:00 amazon-ssm-agent.deb
-rw-r--r--  1 afour afour     7594 Nov 13 16:36 bashrc
-rw-r--r--  1 afour afour      110 Dec  2 20:26 green-cm-1.yaml
-rw-r--r--  1 afour afour      170 Dec  2 20:22 green-cm.yaml
-rw-r--r--  1 afour afour      731 Dec  2 20:40 green.yaml
-rw-r--r--  1 afour afour       19 Dec  2 20:05 index.html
-rw-r--r--  1 afour afour      132 Dec  2 20:15 yellow-cm.yaml
-rw-r--r--  1 afour afour       20 Dec  2 20:22 yellow.html
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ vi green-cm-1.yaml 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ 
afour@A4G354-PCUbuntu:~/temp$ vi green.yaml 
afour@A4G354-PCUbuntu:~/temp$ 

```







---
- Refs:
  - https://alibaba-cloud.medium.com/how-to-create-and-use-configmaps-in-kubernetes-e6d1e0b150b4
  - https://www.magalix.com/blog/kubernetes-patterns-environment-variables-configuration-pattern
  - https://humanitec.com/blog/handling-environment-variables-with-kubernetes