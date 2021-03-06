
##### Cluster API Provider Docker
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
