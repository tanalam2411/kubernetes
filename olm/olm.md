##### Operator Lifecycle Manager(OLM)

- OLM is a set of cluster resources that manage the lifecycle of an Operator.
- OLM is the Definition, Installation, Resolution, Upgrading and Removal of Operators
- OLM is the Automation of Operator Lifecycle

Features:
- App Store-like experience for discovering and installing operators
- Automated upgrades for operators
- Framework for building rich, re-usable user interfaces (API as well as UI)
- Package management and dependency resolution

---

- Architecture: 
```bash
$ k get all -n olm
NAME                                   READY   STATUS    RESTARTS   AGE
pod/catalog-operator-c8bc7f97c-rbdqh   1/1     Running   0          5h29m
pod/olm-operator-84cfcdbdb8-szgjd      1/1     Running   0          5h29m
pod/operatorhubio-catalog-mp7s7        1/1     Running   0          5h29m
pod/packageserver-5db4f9454b-hwzff     1/1     Running   0          5h29m
pod/packageserver-5db4f9454b-k6chb     1/1     Running   0          5h29m

NAME                            TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)     AGE
service/operatorhubio-catalog   ClusterIP   10.109.231.179   <none>        50051/TCP   5h29m
service/packageserver-service   ClusterIP   10.109.84.69     <none>        5443/TCP    5h29m

NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/catalog-operator   1/1     1            1           5h29m
deployment.apps/olm-operator       1/1     1            1           5h29m
deployment.apps/packageserver      2/2     2            2           5h29m

NAME                                         DESIRED   CURRENT   READY   AGE
replicaset.apps/catalog-operator-c8bc7f97c   1         1         1       5h29m
replicaset.apps/olm-operator-84cfcdbdb8      1         1         1       5h29m
replicaset.apps/packageserver-5db4f9454b     2         2         2       5h29m

```

- Two main operators:
  - olm
    - ClusterServiceVersion(CSV) - package manifest for an operator [e.g](https://github.com/operator-framework/community-operators/blob/master/upstream-community-operators/strimzi-kafka-operator/0.19.0/strimzi-cluster-operator.v0.19.0.clusterserviceversion.yaml)
  - catalog
    - Manages `CatalogSource` which has resource such as `Packages`, `Subscription` and `InstallPlan` 
    
    
---
- CSV(ClusterServiceVersion) - specification file for what this operator is and how it should run(analogous to dpkg, rpm, or setup.py)
