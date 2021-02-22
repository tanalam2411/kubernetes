

1. Cloning `metal3-dev-env` repo
```bash
/ws$ git clone https://github.com/metal3-io/metal3-dev-env.git
Cloning into 'metal3-dev-env'...
remote: Enumerating objects: 9, done.
remote: Counting objects: 100% (9/9), done.
remote: Compressing objects: 100% (9/9), done.
remote: Total 5020 (delta 1), reused 2 (delta 0), pack-reused 5011
Receiving objects: 100% (5020/5020), 1.25 MiB | 919.00 KiB/s, done.
Resolving deltas: 100% (3054/3054), done.

/ws$ cd metal3-dev-env/

/ws/metal3-dev-env$ ls -1 lib/
common.sh
images.sh
ironic_basic_auth.sh
ironic_tls_setup.sh
logging.sh
network.sh
releases.sh

```

2. Setting env variables
```bash
export CAPM3_VERSION=v1alpha4
export IMAGE_OS=Ubuntu
export EPHEMERAL_CLUSTER=kind
export CONTAINER_RUNTIME=docker
export NUM_NODES=2
```

```
sudo scp /opt/metal3-dev-env/ironic/html/images/UBUNTU_20.04_NODE_IMAGE_K8S_v1.20.0.qcow2 tan@192.168.0.11:/home/tan/temp/metal3-dev-env 
tan@192.168.0.11's password: 
UBUNTU_20.04_NODE_IMAGE_K8S_v1.20.0.qcow2    
```
