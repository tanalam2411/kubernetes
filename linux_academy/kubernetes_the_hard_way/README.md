# kubernetes\_the\_hard\_way

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ Index \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

1. [Setting Up the Servers](1.setting\_up\_the\_servers.md)
2. [CA and TLS Certificates](2.CA\_and\_TLS\_certificates.md)
3. [Provisioning the CA](3.provisioning\_the\_CA.md)
4. [Generate Client Certificates](4.generate\_client\_certficates.md)
5. [Generating the Kubernetes API Server Certificate](5.generating\_kubernetes\_api\_server\_certificates.md)
6. [Generating the Service Account key pair](6.generating\_service\_account\_key\_pair.md)
7. [Distributing the Certificate Files](7.distributing\_the\_certificate\_files.md)

* Generating Kubernetes Configuration Files for Authentication

1. [kubeconfig](8.kubeconfigs.md)
2. [Generating Kubeconfigs for the Cluster](9.generating\_kubeconfigs\_for\_the\_cluster.md)
3. [Distributing kubeconfig files](10.distributing\_kubeconfig\_files.md)

* Generating the Data Encryption Config and Key

1. [What is the Data Encryption Config in Kubenretes?](11.data\_encryption\_config.md)
2. [Generating the Data Encryption Config](12.generating\_data\_encryption\_config.md)

* Bootstrapping the etcd Cluster

1. [What is etcd?](13.what\_is\_etcd.md)
2. [Creating the etcd Cluster](14.creating\_the\_etcd\_cluster.md)

* Bootstrapping the kubernetes Control Plane

1. [What is the Kubernetes Control Plane](15.what\_is\_k8s\_control\_plane.md)
2. [Installing Kubernetes Control Plane Binaries](16.installing\_kubernetes\_control\_plane\_binaries.md)
3. [Setting up the Kubernetes API Server](17.setting\_up\_the\_k8s\_api\_server.md)
4. [Setting up the Kubernetes Controller Manager](18.setting\_up\_the\_k8s\_controller\_manager.md)
5. [Setting up the Kubernetes Scheduler](19.setting\_up\_the\_k8s\_scheduler.md)
6. [Enable HTTP Health Checks](20.enable\_http\_health\_checks.md)
7. [Set up RBAC for Kublet Authorization](21.setup\_rbac\_for\_kublet\_authorization.md)
8. [Setting up a kube API Frontend Load Balancer](22.setting\_up\_kube\_api\_frontend\_load\_balancer.md)

* Bootstrapping the kubernetes Worker Nodes

1. [What are the kubernetes Worker Nodes?](23.what\_are\_k8s\_worker\_nodes.md)
2. [Installing Worker nodes Binaries](24.installing\_worker\_node\_binaries.md)
3. [Configuring Kubelet](25.configuring\_kubelet.md)
4. [Configuring kube-Proxy](26.configuring\_kube\_proxy.md)

* Configuring Kubectl for Remote Access

1. [Kubernetes Remote Access and Kubectl](27.k8s\_remote\_access\_and\_kubectl.md)

* Networking

1. [The Kubernetes networking model](28.k8s\_networking\_model.md)
2. [Cluster Network Architecture](29.cluster\_network\_architecture.md)
3. [Installing Weave Net](30.installing\_weave\_net.md)

* Deploying the DNS cluster Add-on

1. [DNS in a Kubernetes Pod Network](31.dns\_in\_a\_k8s\_pod\_network.md)
2. [Deploying Kube-dns to the Cluster](32.deploying\_kube\_dns\_to\_the\_cluster.md)

* Smoke Test

1. [Smoke Test](./)

***

Kubernetes Remote Access and Kubectl

kubectl is the k8s command line tool. It allows us to interact with k8s clusters from the command line. In a separate shell, open up an ssh tunnel to port 6443 on your Kubernetes API load balancer:

```bash
$ ssh -L 6443:localhost:6443 user@<your Load balancer cloud server public IP>
```

***

* Kubernetes the Easy Way
* Kubeadm
* Minikube
* Google, AWS, and Azure all provided hosted kubernetes solutions
* https://kubernetes.io/docs/setup/
* https://v1-13.docs.kubernetes.io/docs/setup/pick-right-solution/

***

* Next Steps:
  * CKA
  * Implementing a Full CI/CD Pipeline
  * LPI DevOps Tools Engineer Certification

***

Ref

1. [kelseyhightower-kubernetes-the-hard-way](https://github.com/kelseyhightower/kubernetes-the-hard-way)
