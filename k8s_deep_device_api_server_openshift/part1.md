
[`ref`](https://blog.openshift.com/kubernetes-deep-dive-api-server-part-1/.)

- The API server is the central management entity and the only component that directly talks with the distributed storage component `etcd`.

- `Core Group` - `/api/v1`
- `Named Groups` - `/api/$NAME/$VERSION`
- `System-wide` - `/metrics`

![k8 http api](https://i0.wp.com/blog.openshift.com/wp-content/uploads/API-server-space.png?resize=1024%2C604&ssl=1)
---
# minishift Didn't work
Setting Up the Virtualization Environment for `Minishift`:

```bash
$ sudo apt install libvirt-bin qemu-kvm -y
$ sudo usermod -a -G libvirtd $(whoami)
$ newgrp libvirtd
$ sudo curl -L https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.10.0/docker-machine-driver-kvm-ubuntu16.04 -o /usr/local/bin/docker-machine-driver-kvm
$ chmod +x /usr/local/bin/docker-machine-driver-kvm

$ systemctl is-active libvirtd
inactive
$ systemctl start libvirtd
$ systemctl is-active libvirtd
active
$ sudo virsh net-list --all
 Name                 State      Autostart     Persistent
----------------------------------------------------------
 default              active     yes           yes

```


Download `minishift` from here : https://github.com/minishift/minishift/releases
```bash
$ wget https://github.com/minishift/minishift/releases/download/v1.34.1/minishift-1.34.1-linux-amd64.tgz
$ sudo tar -xzvf minishift-1.34.1-linux-amd64.tgz -C /usr/local/minishift
$ sudo mv /usr/local/minishift/minishift-1.34.1-linux-amd64/ /usr/local/minishift/bin
$ export PATH=$PATH:/usr/local/minishift/bin

```

---


Using Kind:

- Run proxy of k8's API server:
```bash
$ kubectl proxy --port=8080
Starting to serve on 127.0.0.1:8080

```

- `api-versions` - Prints the supported API versions on the server, in the form of "group/version"
```bash
$ kubectl  api-versions
admissionregistration.k8s.io/v1beta1
apiextensions.k8s.io/v1beta1
apiregistration.k8s.io/v1
apiregistration.k8s.io/v1beta1
apps/v1
apps/v1beta1
apps/v1beta2
authentication.k8s.io/v1
authentication.k8s.io/v1beta1
authorization.k8s.io/v1
authorization.k8s.io/v1beta1
autoscaling/v1
autoscaling/v2beta1
autoscaling/v2beta2
batch/v1
batch/v1beta1
certificates.k8s.io/v1beta1
coordination.k8s.io/v1
coordination.k8s.io/v1beta1
events.k8s.io/v1beta1
extensions/v1beta1
networking.k8s.io/v1
networking.k8s.io/v1beta1
node.k8s.io/v1beta1
policy/v1beta1
rbac.authorization.k8s.io/v1
rbac.authorization.k8s.io/v1beta1
scheduling.k8s.io/v1
scheduling.k8s.io/v1beta1
storage.k8s.io/v1
storage.k8s.io/v1beta1
v1

```

```bash
$ curl http://127.0.0.1:8080/apis/batch/v1
{
  "kind": "APIResourceList",
  "apiVersion": "v1",
  "groupVersion": "batch/v1",
  "resources": [
    {
      "name": "jobs",
      "singularName": "",
      "namespaced": true,
      "kind": "Job",
      "verbs": [
        "create",
        "delete",
        "deletecollection",
        "get",
        "list",
        "patch",
        "update",
        "watch"
      ],
      "categories": [
        "all"
      ],
      "storageVersionHash": "mudhfqk/qZY="
    },
    {
      "name": "jobs/status",
      "singularName": "",
      "namespaced": true,
      "kind": "Job",
      "verbs": [
        "get",
        "patch",
        "update"
      ]
    }
  ]
}



$ curl http://127.0.0.1:8080/apis/batch/v1beta1
{
  "kind": "APIResourceList",
  "apiVersion": "v1",
  "groupVersion": "batch/v1beta1",
  "resources": [
    {
      "name": "cronjobs",
      "singularName": "",
      "namespaced": true,
      "kind": "CronJob",
      "verbs": [
        "create",
        "delete",
        "deletecollection",
        "get",
        "list",
        "patch",
        "update",
        "watch"
      ],
      "shortNames": [
        "cj"
      ],
      "categories": [
        "all"
      ],
      "storageVersionHash": "h/JlFAZkyyY="
    },
    {
      "name": "cronjobs/status",
      "singularName": "",
      "namespaced": true,
      "kind": "CronJob",
      "verbs": [
        "get",
        "patch",
        "update"
      ]
    }
  ]
}

```

- A specification is a complete description of the desired state and is persisted in stable storage.
- Objects - pods, services, endpoints, deployment
- `kind` - type of an entity or object.

There are three categories of `Kinds`:
1. `Objects` - represent a persistent entity in the system. e.g. `Pod`, `Namespace`.
2. `Lists` - Collections of resources of one or more `kinds` of entities. e.g. `PodLists` and `NodeLists`.
3. `Special purpose kinds` - Used for specific actions on objects and for non-persistent entities such as `/binding` or `/status`, discovery uses `APIGroup` and `APIResource`, error results  use `Status`, etc.

**`API Group`** - is a collection of `kinds` that are logically related. e.g. `Job` and `ScheduledJob` are in the `batch` API Group.

**`Version`** - `v1alpha1` -> `v1beta1` -> `v1`

**`Resource`** - Entity sent|received as JSON via HTTP.

- So an `API Group`, a `Version` and a `Resource` `(GVR)`  uniquely defines a `HTTP` path:

> /apis/{API Group}/{VERSION}/{Resource}

> e.g. /apis/batch/v1/jobs

- more precisely, the actual path for jobs is:
> /apis/batch/v1/namespaces/$NAMESPACE/jobs
  
because jobs are not a cluster-wide resource.

---

**Request Flow and Processing**

- The API lives in [`kubernetes/pkg/api`](https://github.com/kubernetes/kubernetes/tree/master/pkg/api)