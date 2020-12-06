
---

- Shortcuts

```bash


printf "\nalias k='kubectl'\n\
alias kgn='k get no'\n\
alias kgp='k get po'\n\
alias kgns='k get ns'\n\
alias kgcs='k get cs'\n\
alias kgd='k get deploy'\n\
alias kd='k describe'\n\
alias kar='k api-resources'\n\
alias kcgc='k config get-contexts'\n\
alias kcuc='k config use-context'\n\
"\
>> ~/.bashrc
```
---

```bash
$ kubectl get pods --show-labels
```

---

```bash
$ kubectl run --generator=run-pod/v1 nginx --image=nginx --dry-run=true -o yaml > nginx_pod.yaml
```

---


```bash
$ kubectl run --generator=run-pod/v1 nginx --image=nginx --replicas=2 --dry-run=true -o yaml >> nginx_deploy.yaml
```

---

```bash
$ kgp --show-labels
NAME                     READY   STATUS    RESTARTS   AGE     LABELS
nginx-5578584966-lggjj   1/1     Running   0          9m36s   pod-template-hash=5578584966,run=nginx
nginx-5578584966-sflrp   1/1     Running   0          9m36s   pod-template-hash=5578584966,run=nginx
```

---

```bash

$ kgp -L env
NAME                     READY   STATUS    RESTARTS   AGE   ENV
nginx-5578584966-lggjj   1/1     Running   0          23m   prod
nginx-5578584966-sflrp   1/1     Running   0          23m   
```

---

```bash
$ ka deploy nginx test="true"
deployment.apps/nginx annotated

$ kgd nginx -o yaml | grep -A 2 anno
  annotations:
    deployment.kubernetes.io/revision: "1"
    test: "true"

```

---
- Deleting all pods within a given namespace

```bash
$ kubectl get pods -n default --no-headers=true | awk '{print $1}'| xargs  kubectl delete -n default pod
```

---
- Delete everything from the current namespace 

```bash
kubectl delete all --all -n {namespace}
```
or Delete the namespace - This will delete all resources within ns
```bash
kubectl delete all --all -n {namespace}
```

---

- Create new namespace
```
$ kubectl create ns <name>
```

- Set default namespace
```
$ kubectl config set-context --current --namespace=<name>
```

- Check current namespace
```
$ kubectl config view --minity=true
```

---


- Dec 2020

1. MultiContainer Deployment
```bash
$ k create deploy deploy1 --image=nginx,busybox -r=2 --dry-run=client -o yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: deploy1
  name: deploy1
spec:
  replicas: 2
  selector:
    matchLabels:
      app: deploy1
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: deploy1
    spec:
      containers:
      - image: nginx
        name: nginx
        resources: {}
      - image: busybox
        name: busybox
        resources: {}
status: {}

```

2. `Back-off restarting failed container` - Add `-- sleep infinity`
```bash
$ k run busybox --image=busybox -- sleep infinity

$ k get po busybox -o yaml| grep -i -A 5 ' args:'
  - args:
    - sleep
    - infinity
    image: busybox
    imagePullPolicy: Always
    name: busybox

$ k run busybox1 --image=busybox -- sleep 300

$ k get po busybox1 -o yaml | grep -i -A 5 ' args:'
  - args:
    - sleep
    - "300"
    image: busybox
    imagePullPolicy: Always
    name: busybox1
```

3. Deployment
```bash
$ k create deploy nginx --image=nginx,busybox -r=3

# Add args (sleep infinity) to busybox
$ k get deploy nginx -o yaml | grep -i -A 5 -C 5 " args:"
        imagePullPolicy: Always
        name: nginx
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
      - args:
        - sleep
        - infinity
        image: busybox
        imagePullPolicy: Always
        name: busybox
```

4. Change replicas of deployment
```bash
$ k scale deploy nginx --replicas=5
```

5. Create Service 
```bash
$ k create service nodeport nginx-svc --tcp=80:80 --node-port=30001 -o yaml

# Update svc selector, with deploy labels
$ k get deploy
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
nginx   5/5     5            5           158m
$ k get deploy nginx -o yaml | grep -i -A 5 " label"
  labels:
    app: nginx
  managedFields:
  - apiVersion: apps/v1
    fieldsType: FieldsV1
    fieldsV1:
--
      labels:
        app: nginx
    spec:
      containers:
      - image: nginx
        imagePullPolicy: Always

$ k get svc
NAME         TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)        AGE
kubernetes   ClusterIP   10.96.0.1     <none>        443/TCP        45h
nginx-svc    NodePort    10.96.7.250   <none>        80:30001/TCP   6m35s
$ k get svc nginx-svc -o yaml | grep -i -A 5 " selector"
  selector:
    app: nginx
  sessionAffinity: None
  type: NodePort
status:
  loadBalancer: {}

```

6. Create Pod and expose in single cmd:
```bash
$ k run httpd --image=httpd:alpine --port=80 --expose --dry-run=client -o yaml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  name: httpd
spec:
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
  selector:
    run: httpd
status:
  loadBalancer: {}
---
---
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: httpd
  name: httpd
spec:
  containers:
  - image: httpd:alpine
    name: httpd
    ports:
    - containerPort: 80
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

```

7. Command line arguments
  - In dockerfile `ENTRYPOINT` includes the process that needs to be executed on docker run
  - And `CMD` is the cmd or default argument to the entrypoint
  - E.g. `ENTRYPOINT ["sleep"]` and `CMD ["5"]`, so if we do just docker run, then it will run `sleep 5` while running the container
  - If you want to run with different number, docker run with some argument `docker run container_name 10`, this will override the `CMD` default `5` value
  - If dockerfile includes everything in `CMD` then you can't over write it while running docker run, it will always run `sleep 5`
  - `ENTRYPOINT` can be overriden while performing docker run `--ENTRYPOINT`
  - In POD's Spec definition, `command` act as entry point and `args` act as `CMD`  
```yaml
spec:
  containers:
  - command:
    - sleep
    - "4800"
    image: 

- name: xyz
  image: xyzimage
  command: ["python", "app.py"]
  args: ["--color", "pink"]
```
```bash
$ k run busybox --image=busybox --dry-run=client -o yaml > busybox.yaml
# Add command in the yaml
$ cat busybox.yaml 
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: busybox
  name: busybox
spec:
  containers:
  - image: busybox
    name: busybox
    command:
    - sleep
    - "5000"
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

```


8. If asked to change or pass the command line argument, then pass it in args
  - Eg. Pass command line argument, `--color=green`
```yaml
container:
- args: ["--color=green"]
```

  - Eg. Pass command line argument, `--color green`
```yaml
container:
- args: ["--color", "green"]
```


9. Set `Environment variables`
```yaml
env:
  - name: KEY1
    value: Value1

env:
  - name: KEY1
    valueFrom:
      configMapKeyRef:

env:
  - name: KEY1
    valueFrom:
      secretKeyRef:
```


10. ConfigMaps
```bash
$ k create cm cm1 --from-literal=KEY1=VALUE1 --from-literal=KEY2=VALUE2 --dry-run=client -o yaml
apiVersion: v1
data:
  KEY1: VALUE1
  KEY2: VALUE2
kind: ConfigMap
metadata:
  creationTimestamp: null
  name: cm1

```

11. ConfigMaps - kubectl Explain
```bash
$ k explain pods --recursive | grep -i volumes -A50 | grep -i config -A5
         configMap	<Object>
            defaultMode	<integer>
            items	<[]Object>
               key	<string>
               mode	<integer>
               path	<string>

$ k explain pods --recursive | grep -i envFrom -A7
         envFrom	<[]Object>
            configMapRef	<Object>
               name	<string>
               optional	<boolean>
            prefix	<string>
            secretRef	<Object>
               name	<string>
               optional	<boolean>
--
```


12. Secretes
- https://kubernetes.io/docs/tasks/configmap-secret/managing-secret-using-kubectl/
```bash
$ k create secret generic secret1 --from-literal=k1=v1 --from-literal=k2=v2

$ kd secret secret1
Name:         secret1
Namespace:    default
Labels:       <none>
Annotations:  <none>

Type:  Opaque

Data
====
k1:  2 bytes
k2:  2 bytes


$ k get secret secret1
NAME      TYPE     DATA   AGE
secret1   Opaque   2      81s
$ k get secret secret1 -o jsonpath='{.data}'
{"k1":"djE=","k2":"djI="}$ 
$ 
$ echo "djE=" | base64 --decode
v1
```























---
- Blogs:
  - https://ahmet.im/blog/kubectl-aliases/
