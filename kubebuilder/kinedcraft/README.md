# kinedcraft

**kinecraft**

1. Downloading and installing kubebuilder

* Download kubebuilder binary from `https://github.com/kubernetes-sigs/kubebuilder/releases`

```bash
$ wget https://github.com/kubernetes-sigs/kubebuilder/releases/download/v2.0.0/kubebuilder_2.0.0_linux_amd64.tar.gz

$ tar -xvf kubebuilder_2.0.0_linux_amd64.tar.gz 
kubebuilder_2.0.0_linux_amd64/bin/etcd
kubebuilder_2.0.0_linux_amd64/bin/kube-apiserver
kubebuilder_2.0.0_linux_amd64/bin/kubectl
kubebuilder_2.0.0_linux_amd64/bin/kubebuilder

$ sudo mv kubebuilder_2.0.0_linux_amd64 /usr/local/kubebuilder

$ ls /usr/local/kubebuilder/bin/
etcd  kube-apiserver  kubebuilder  kubectl
```

```bash
# add in bashrc or profile
$ export PATH=$PATH:/usr/local/kubebuilder/bin

$ kubebuilder version
Version: version.Version{KubeBuilderVersion:"2.0.0", KubernetesVendor:"1.14.1", GitCommit:"b31cc5d96dbc91749eb49c2cf600bd951a46d4bd", BuildDate:"2019-08-22T23:39:53Z", GoOs:"unknown", GoArch:"unknown"}
```

1. Downloading and installing kustomize

* Downloaf kustomize binary from `https://github.com/kubernetes-sigs/kustomize/releases`

```bash
$ wget https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv3.3.0/kustomize_v3.3.0_linux_amd64.tar.gz

$ tar -xvf kustomize_v3.3.0_linux_amd64.tar.gz

$ mv kustomize /usr/local/kubebuilder/bin/
```

1. Creating Project (kinecraft)

```bash
kinedcraft$ go mod init github.com/tanalam2411/kinecraft
go: creating new go.mod: module github.com/tanalam2411/kinecraft

kinedcraft$ cat go.mod 
module github.com/tanalam2411/kinecraft

go 1.13
```

```bash
kinedcraft$ kubebuilder init --domain github.com --license apache2 --owner "Tanveer Alam"
go mod tidy
Running make...
make
/home/tan/go/bin/controller-gen object:headerFile=./hack/boilerplate.go.txt paths="./..."
go fmt ./...
go vet ./...
go build -o bin/manager main.go
Next: Define a resource with:
$ kubebuilder create api
```

1. Creating an API

```bash
kinedcraft$ kubebuilder create api --group minecraft --version v1alpha1 --kind Server
Create Resource [y/n]
y
Create Controller [y/n]
y
Writing scaffold for you to edit...
api/v1alpha1/server_types.go
controllers/server_controller.go
Running make...
/home/tan/go/bin/controller-gen object:headerFile=./hack/boilerplate.go.txt paths="./..."
go fmt ./...
go vet ./...
go build -o bin/manager main.go
```

```bash
kinedcraft$ cat go.mod 
module github.com/tanalam2411/kinecraft

go 1.12

require (
	github.com/go-logr/logr v0.1.0
	github.com/onsi/ginkgo v1.6.0
	github.com/onsi/gomega v1.4.2
	k8s.io/apimachinery v0.0.0-20190404173353-6a84e37a896d
	k8s.io/client-go v11.0.1-0.20190409021438-1a26190bd76a+incompatible
	sigs.k8s.io/controller-runtime v0.2.0
)
```

1. Creating kubernetes cluster using kind to test against

```bash
kubernetes/kubebuilder$ kind create cluster --config kind_configs/multi-node-cluster.yaml 
Creating cluster "kind" ...
 ✓ Ensuring node image (kindest/node:v1.15.3) 🖼
 ✓ Preparing nodes 📦📦📦 
 ✓ Creating kubeadm config 📜 
 ✓ Starting control-plane 🕹️ 
 ✓ Installing CNI 🔌 
 ✓ Installing StorageClass 💾 
 ✓ Joining worker nodes 🚜 
Cluster creation complete. You can now use the cluster with:

export KUBECONFIG="$(kind get kubeconfig-path --name="kind")"
kubectl cluster-info
```

```bash
kubernetes/kubebuilder$ kubectl cluster-info
Kubernetes master is running at https://127.0.0.1:41207
KubeDNS is running at https://127.0.0.1:41207/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
kubernetes/kubebuilder$ docker ps
CONTAINER ID        IMAGE                  COMMAND                  CREATED             STATUS              PORTS                                  NAMES
902c42a5542f        kindest/node:v1.15.3   "/usr/local/bin/entr…"   4 minutes ago       Up 3 minutes                                               kind-worker
b73e16bd3669        kindest/node:v1.15.3   "/usr/local/bin/entr…"   4 minutes ago       Up 3 minutes                                               kind-worker2
f31cd3d1c6e4        kindest/node:v1.15.3   "/usr/local/bin/entr…"   4 minutes ago       Up 3 minutes        41207/tcp, 127.0.0.1:41207->6443/tcp   kind-control-plane
```

1. Update `server_types.go:ServerSpec`, add fields and then run `make manifests`

This will generate manifest `config/crd/bases/minecraft.github.com_servers.yaml`

```bash
kinedcraft$ make manifests
/home/tan/go/bin/controller-gen "crd:trivialVersions=true" rbac:roleName=manager-role webhook paths="./..." output:crd:artifacts:config=config/crd/bases
```

1. Installing CRDs into cluster

```bash
kinedcraft$ make install
/home/tan/go/bin/controller-gen "crd:trivialVersions=true" rbac:roleName=manager-role webhook paths="./..." output:crd:artifacts:config=config/crd/bases
kustomize build config/crd | kubectl apply -f -
customresourcedefinition.apiextensions.k8s.io/servers.minecraft.github.com created
```

Note: Make sure `export KUBECONFIG="$(kind get kubeconfig-path --name="kind")"` KUBECONFIG env is exported.

1. Run Tests

```bash
kinedcraft$ make test
/home/tan/go/bin/controller-gen object:headerFile=./hack/boilerplate.go.txt paths="./..."
go fmt ./...
go vet ./...
/home/tan/go/bin/controller-gen "crd:trivialVersions=true" rbac:roleName=manager-role webhook paths="./..." output:crd:artifacts:config=config/crd/bases
go test ./... -coverprofile cover.out
?   	github.com/tanalam2411/kinecraft	[no test files]
?   	github.com/tanalam2411/kinecraft/api/v1alpha1	[no test files]
ok  	github.com/tanalam2411/kinecraft/controllers	10.511s	coverage: 0.0% of statements
```

1. Run

```bash
kinedcraft$ make run
/home/tan/go/bin/controller-gen object:headerFile=./hack/boilerplate.go.txt paths="./..."
go fmt ./...
go vet ./...
/home/tan/go/bin/controller-gen "crd:trivialVersions=true" rbac:roleName=manager-role webhook paths="./..." output:crd:artifacts:config=config/crd/bases
go run ./main.go
2019-10-27T12:05:23.043+0530	INFO	controller-runtime.metrics	metrics server is starting to listen	{"addr": ":8080"}
2019-10-27T12:05:23.044+0530	INFO	controller-runtime.controller	Starting EventSource	{"controller": "server", "source": "kind source: /, Kind="}
2019-10-27T12:05:23.044+0530	INFO	setup	starting manager
2019-10-27T12:05:23.044+0530	INFO	controller-runtime.manager	starting metrics server	{"path": "/metrics"}
2019-10-27T12:05:23.145+0530	INFO	controller-runtime.controller	Starting Controller	{"controller": "server"}
2019-10-27T12:05:23.245+0530	INFO	controller-runtime.controller	Starting workers	{"controller": "server", "worker count": 1}


```

1. Create minecraft server -

```bash
kubernetes/kubebuilder$ kubectl create -f kinedcraft/config/samples/minecraft_v1alpha1_server.yaml
server.minecraft.github.com/my-sample created
```

```bash
2019-10-28T08:30:15.702+0530	DEBUG	controllers.Server	created Pod for server run	{"server": "default/my-sample", "pod": {"namespace": "default", "name": "mc-my-sample"}}
2019-10-28T08:30:15.702+0530	DEBUG	controller-runtime.controller	Successfully Reconciled	{"controller": "server", "request": "default/my-sample"}
```
