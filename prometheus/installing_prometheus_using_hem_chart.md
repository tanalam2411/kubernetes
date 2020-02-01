

- `$ git clone https://github.com/helm/charts.git`
- `$ cd charts/stable/prometheus-operator/`
- `$ helm dependency update`
- `$ cd ../..`
-  
    ```bash
    /charts$ helm install  stable/prometheus-operator --generate-name
    manifest_sorter.go:175: info: skipping unknown hook: "crd-install"
    manifest_sorter.go:175: info: skipping unknown hook: "crd-install"
    manifest_sorter.go:175: info: skipping unknown hook: "crd-install"
    manifest_sorter.go:175: info: skipping unknown hook: "crd-install"
    manifest_sorter.go:175: info: skipping unknown hook: "crd-install"
    NAME: prometheus-operator-1580567000
    LAST DEPLOYED: Sat Feb  1 19:53:27 2020
    NAMESPACE: default
    STATUS: deployed
    REVISION: 1
    NOTES:
    The Prometheus Operator has been installed. Check its status by running:
      kubectl --namespace default get pods -l "release=prometheus-operator-1580567000"
    
    Visit https://github.com/coreos/prometheus-operator for instructions on how
    to create & configure Alertmanager and Prometheus instances using the Operator.
    
    ```
- 
```bash
/charts$ kubectl get pods
NAME                                                              READY   STATUS    RESTARTS   AGE
alertmanager-prometheus-operator-158056-alertmanager-0            2/2     Running   0          7m20s
prometheus-operator-158056-operator-6c7b659989-r2cxw              2/2     Running   0          7m58s
prometheus-operator-1580567000-grafana-56554d57b4-9d5vs           2/2     Running   0          7m58s
prometheus-operator-1580567000-kube-state-metrics-65c6849f6frqb   1/1     Running   0          7m58s
prometheus-operator-1580567000-prometheus-node-exporter-b4cpz     1/1     Running   0          7m58s
prometheus-prometheus-operator-158056-prometheus-0                3/3     Running   1          7m9s

/charts$ kubectl get svc
NAME                                                      TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)                      AGE
alertmanager-operated                                     ClusterIP   None           <none>        9093/TCP,9094/TCP,9094/UDP   7m53s
kubernetes                                                ClusterIP   10.96.0.1      <none>        443/TCP                      10h
prometheus-operated                                       ClusterIP   None           <none>        9090/TCP                     7m42s
prometheus-operator-158056-alertmanager                   ClusterIP   10.96.58.255   <none>        9093/TCP                     8m31s
prometheus-operator-158056-operator                       ClusterIP   10.96.97.72    <none>        8080/TCP,443/TCP             8m31s
prometheus-operator-158056-prometheus                     ClusterIP   10.96.3.94     <none>        9090/TCP                     8m31s
prometheus-operator-1580567000-grafana                    ClusterIP   10.96.56.60    <none>        80/TCP                       8m31s
prometheus-operator-1580567000-kube-state-metrics         ClusterIP   10.96.61.81    <none>        8080/TCP                     8m31s
prometheus-operator-1580567000-prometheus-node-exporter   ClusterIP   10.96.75.132   <none>        9100/TCP                     8m31s

```          




-----
refs
- [1](https://github.com/helm/charts/tree/master/stable/prometheus-operator)