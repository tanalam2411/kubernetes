

1. Creating `monitoring` namespace:

```bash
content-kubernetes-prometheus-env/prometheus$ kubectl apply -f namespaces.yml 
namespace/monitoring created

$ kubectl get ns
NAME                 STATUS   AGE
default              Active   26h
kube-node-lease      Active   26h
kube-public          Active   26h
kube-system          Active   26h
local-path-storage   Active   26h
monitoring           Active   15s

```

2. Update config map `prometheus-config-map.yml` with each node's IP address.
```bash
    scrape_configs:
      - job_name: 'node-exporter'
        static_configs:
        - targets: ['172.17.0.4:9100', '172.17.0.2:9100', '172.17.0.3:9100']
```

```bash
content-kubernetes-prometheus-env/prometheus$ kubectl apply -f prometheus-config-map.yml 
configmap/prometheus-server-conf created

$ kubectl describe cm prometheus-server-conf -n monitoring
```


3. Apply deployment:
```bash
content-kubernetes-prometheus-env/prometheus$ kubectl apply -f prometheus-deployment.yml 
deployment.apps/prometheus-deployment created

```

4. Apply service:
```bash
ontent-kubernetes-prometheus-env/prometheus$ kubectl apply -f prometheus-service.yml 
service/prometheus-service created
```

```bash
$ kubectl get services -n monitoring
NAME                 TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
prometheus-service   NodePort   10.96.187.179   <none>        8080:30000/TCP   15s
```
Browse - http://172.17.0.4:30000/

5. Apply cluster role:

```bash
content-kubernetes-prometheus-env/prometheus$ kubectl apply -f clusterRole.yml 
clusterrole.rbac.authorization.k8s.io/prometheus created
clusterrolebinding.rbac.authorization.k8s.io/prometheus created

```

6. Apply `kube-state-metrics` 

```bash
content-kubernetes-prometheus-env/prometheus$ kubectl apply -f kube-state-metrics.yml 
service/kube-state-metrics unchanged
deployment.apps/kube-state-metrics created

```