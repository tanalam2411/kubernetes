# capd

**Cluster API Provider Docker**

```
tan@tan:~/ws/cluster-api$ ./cmd/clusterctl/hack/create-local-repository.py 
clusterctl local overrides generated from local repositories for the cluster-api, bootstrap-kubeadm, control-plane-kubeadm, infrastructure-docker providers.
in order to use them, please run:
clusterctl init \
   --core cluster-api:v0.4.0 \
   --bootstrap kubeadm:v0.4.0 \
   --control-plane kubeadm:v0.4.0 \
   --infrastructure docker:v0.4.0 \
   --config ~/.cluster-api/dev-repository/config.yaml
please check the documentation for additional steps required for using the docker provider
```



```bash
tan@tan:~/clusterapi$ clusterctl init --infrastructure docker
Fetching providers
Installing cert-manager Version="v0.16.1"
Waiting for cert-manager to be available...
Installing Provider="cluster-api" Version="v0.3.14" TargetNamespace="capi-system"
Installing Provider="bootstrap-kubeadm" Version="v0.3.14" TargetNamespace="capi-kubeadm-bootstrap-system"
Installing Provider="control-plane-kubeadm" Version="v0.3.14" TargetNamespace="capi-kubeadm-control-plane-system"
Installing Provider="infrastructure-docker" Version="v0.3.14" TargetNamespace="capd-system"

Your management cluster has been initialized successfully!

You can now create your first workload cluster by running the following:

  clusterctl config cluster [name] --kubernetes-version [version] | kubectl apply -f -
```

***

* https://github.com/kubernetes-sigs/cluster-api/issues/4027
