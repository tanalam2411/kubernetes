
---
1. 

```bash
$ k get po
NAME      READY   STATUS    RESTARTS   AGE
my-app    1/1     Running   0          4d4h
my-app2   1/1     Running   0          4d4h
my-app3   1/1     Running   0          4d5h

$ k get po -o jsonpath='{range .items[*]}{"pod: "}{.metadata.name}{"\n"}{range .spec.containers[
*]}{"\tname: "}{.name}{"\n\timage: "}{.image}{"\n"}{end}'
pod: my-app
        name: my-app
        image: nginx
pod: my-app2
        name: my-app2
        image: nginx
pod: my-app3
        name: my-app3
        image: nginx
```
---





--- 
- Refs:
  - https://kubernetes.io/docs/reference/kubectl/jsonpath/
  - https://stackoverflow.com/questions/33924198/how-do-you-cleanly-list-all-the-containers-in-a-kubernetes-pod
  - https://serverfault.com/questions/873490/how-to-list-all-containers-in-kubernetes