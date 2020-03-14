

1. Apply `grafana-deployment.yml`

```bash
content-kubernetes-prometheus-env/grafana$ kubectl apply -f grafana-deployment.yml 
deployment.apps/grafana created

$ kubectl get pods -n monitoring 
NAME                                    READY   STATUS    RESTARTS   AGE
grafana-6fff4b5dc4-lxlhq                1/1     Running   0          11m
kube-state-metrics-57c85c5bdc-gq928     1/1     Running   0          5h5m
prometheus-deployment-5bdddc4bf-jzkz7   2/2     Running   0          5h29m

```

2. Apply `grafana-service.yml`

```bash
content-kubernetes-prometheus-env/grafana$ kubectl apply -f grafana-service.yml 
service/grafana-service created

$ kubectl get svc -n monitoring
NAME                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
grafana-service      NodePort    10.96.209.90    <none>        3000:30001/TCP   64s
kube-state-metrics   ClusterIP   10.96.203.127   <none>        8080/TCP         5h10m
prometheus-service   NodePort    10.96.187.179   <none>        8080:30000/TCP   5h20m

```

