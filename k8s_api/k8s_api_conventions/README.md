# API Conventions

- Supported verbs - `POST|PUT|DELETE|GET`
- All of the JSON accepted and returned by server has a `schema`, identified by `kind` and `apiVersion` fields.

- **kind**:
  - represents name of a particular object.
  - Kind is a string value representing the REST resource this object represents.

- **Resource**:
  - a representation of a system entity, sent or retrieved as JSON via HTTP to the server. Resources are exposed via:
    - Collections - a list of resources of the same type, which may be queryable
    - Elements - an individual resource, addressable via a URL

- **[API Group](https://github.com/kubernetes/apimachinery/blob/master/pkg/apis/meta/v1/types.go#L925)**:
  - a set of resources that are exposed together. 
  - Along with the version is exposed in the "apiVersion" field as "GROUP/VERSION", e.g. "policy.k8s.io/v1".
  
List of `resources` and their `Api Group`  
  ```bash
  $ kubectl api-resources 
  NAME                              SHORTNAMES   APIGROUP                       NAMESPACED   KIND
  bindings                                                                      true         Binding
  componentstatuses                 cs                                          false        ComponentStatus
  configmaps                        cm                                          true         ConfigMap
  endpoints                         ep                                          true         Endpoints
  events                            ev                                          true         Event
  limitranges                       limits                                      true         LimitRange
  namespaces                        ns                                          false        Namespace
  nodes                             no                                          false        Node
  persistentvolumeclaims            pvc                                         true         PersistentVolumeClaim
  persistentvolumes                 pv                                          false        PersistentVolume
  pods                              po                                          true         Pod
  podtemplates                                                                  true         PodTemplate
  replicationcontrollers            rc                                          true         ReplicationController
  resourcequotas                    quota                                       true         ResourceQuota
  secrets                                                                       true         Secret
  serviceaccounts                   sa                                          true         ServiceAccount
  services                          svc                                         true         Service
  mutatingwebhookconfigurations                  admissionregistration.k8s.io   false        MutatingWebhookConfiguration
  validatingwebhookconfigurations                admissionregistration.k8s.io   false        ValidatingWebhookConfiguration
  customresourcedefinitions         crd,crds     apiextensions.k8s.io           false        CustomResourceDefinition
  apiservices                                    apiregistration.k8s.io         false        APIService
  controllerrevisions                            apps                           true         ControllerRevision
  daemonsets                        ds           apps                           true         DaemonSet
  deployments                       deploy       apps                           true         Deployment
  replicasets                       rs           apps                           true         ReplicaSet
  statefulsets                      sts          apps                           true         StatefulSet
  tokenreviews                                   authentication.k8s.io          false        TokenReview
  localsubjectaccessreviews                      authorization.k8s.io           true         LocalSubjectAccessReview
  selfsubjectaccessreviews                       authorization.k8s.io           false        SelfSubjectAccessReview
  selfsubjectrulesreviews                        authorization.k8s.io           false        SelfSubjectRulesReview
  subjectaccessreviews                           authorization.k8s.io           false        SubjectAccessReview
  horizontalpodautoscalers          hpa          autoscaling                    true         HorizontalPodAutoscaler
  cronjobs                          cj           batch                          true         CronJob
  jobs                                           batch                          true         Job
  certificatesigningrequests        csr          certificates.k8s.io            false        CertificateSigningRequest
  leases                                         coordination.k8s.io            true         Lease
  events                            ev           events.k8s.io                  true         Event
  daemonsets                        ds           extensions                     true         DaemonSet
  deployments                       deploy       extensions                     true         Deployment
  ingresses                         ing          extensions                     true         Ingress
  networkpolicies                   netpol       extensions                     true         NetworkPolicy
  podsecuritypolicies               psp          extensions                     false        PodSecurityPolicy
  replicasets                       rs           extensions                     true         ReplicaSet
  ingresses                         ing          networking.k8s.io              true         Ingress
  networkpolicies                   netpol       networking.k8s.io              true         NetworkPolicy
  runtimeclasses                                 node.k8s.io                    false        RuntimeClass
  poddisruptionbudgets              pdb          policy                         true         PodDisruptionBudget
  podsecuritypolicies               psp          policy                         false        PodSecurityPolicy
  clusterrolebindings                            rbac.authorization.k8s.io      false        ClusterRoleBinding
  clusterroles                                   rbac.authorization.k8s.io      false        ClusterRole
  rolebindings                                   rbac.authorization.k8s.io      true         RoleBinding
  roles                                          rbac.authorization.k8s.io      true         Role
  priorityclasses                   pc           scheduling.k8s.io              false        PriorityClass
  csidrivers                                     storage.k8s.io                 false        CSIDriver
  csinodes                                       storage.k8s.io                 false        CSINode
  storageclasses                    sc           storage.k8s.io                 false        StorageClass
  volumeattachments                              storage.k8s.io                 false        VolumeAttachment

  ```
The `resources` against which `APIGROUP` is not mentioned is part of https://github.com/kubernetes/api/blob/master/core/v1/types.go and all the `APIGROUP`'s can be found here https://github.com/kubernetes/api

Name of the resources are mentioned in the `register.go` file of their package.

Example: https://github.com/kubernetes/api/blob/master/admissionregistration/v1/register.go

```bash
const GroupName = "admissionregistration.k8s.io"
```

- Resources are bound together in API groups.
- Each group may have one or more versions that evolve independent of other API groups, and each version within the group has one or more resources.
  - Example:
  ```bash
  api$ tree -L 2
  .
  ├── admission
  │   ├── v1
  │   └── v1beta1
  ├── admissionregistration
  │   ├── v1
  │   └── v1beta1
  ├── apps
  │   ├── OWNERS
  │   ├── v1
  │   ├── v1beta1
  │   └── v1beta2
  ├── auditregistration
  │   ├── OWNERS
  │   └── v1alpha1
  ├── authentication
  │   ├── OWNERS
  │   ├── v1
  │   └── v1beta1
  ├── authorization
  │   ├── OWNERS
  │   ├── v1
  │   └── v1beta1
  ├── autoscaling
  │   ├── OWNERS
  │   ├── v1
  │   ├── v2beta1
  │   └── v2beta2
  ├── batch
  │   ├── OWNERS
  │   ├── v1
  │   ├── v1beta1
  │   └── v2alpha1
  ├── certificates
  │   ├── OWNERS
  │   └── v1beta1
  ├── code-of-conduct.md
  ├── CONTRIBUTING.md
  ├── coordination
  │   ├── v1
  │   └── v1beta1
  ├── core
  │   └── v1
  ├── discovery
  │   ├── v1alpha1
  │   └── v1beta1
  ├── events
  │   ├── OWNERS
  │   └── v1beta1
  ├── extensions
  │   ├── OWNERS
  │   └── v1beta1
  ├── flowcontrol
  │   └── v1alpha1
  ├── Godeps
  │   ├── Godeps.json
  │   ├── OWNERS
  │   └── Readme
  ├── go.mod
  ├── go.sum
  ├── imagepolicy
  │   ├── OWNERS
  │   └── v1alpha1
  ├── LICENSE
  ├── networking
  │   ├── OWNERS
  │   ├── v1
  │   └── v1beta1
  ├── node
  │   ├── OWNERS
  │   ├── v1alpha1
  │   └── v1beta1
  ├── OWNERS
  ├── policy
  │   ├── OWNERS
  │   └── v1beta1
  ├── rbac
  │   ├── OWNERS
  │   ├── v1
  │   ├── v1alpha1
  │   └── v1beta1
  ├── README.md
  ├── roundtrip_test.go
  ├── scheduling
  │   ├── v1
  │   ├── v1alpha1
  │   └── v1beta1
  ├── SECURITY_CONTACTS
  ├── settings
  │   └── v1alpha1
  ├── storage
  │   ├── OWNERS
  │   ├── v1
  │   ├── v1alpha1
  │   └── v1beta1
  └── testdata
      ├── HEAD
      ├── README.md
      ├── v1.16.0
      └── v1.17.0

  ```
 
 - Group names are typically in domain name form.
 - k8 reserves use of the empty group https://github.com/kubernetes/api/blob/master/core/v1/register.go
   ```go
    // GroupName is the group name use in this package
    const GroupName = ""
    ```
 - k8 reserves use of all single word names("extensions", "apps")  and any group name ending in "*.k8s.io" for its sole use.
   - https://github.com/kubernetes/api/blob/master/apps/v1/register.go
     ```go
     const GroupName = "apps"
     ```
   - https://github.com/kubernetes/api/blob/master/admissionregistration/v1/register.go     
     ```bash
     const GroupName = "admissionregistration.k8s.io"
     ```
 - When choosing a group name, its is recommended selecting a subdomain of your organization, such as "windget.xcompany.com"
 - `Resources` collections should be all lowercase and plural.
 - `Kinds` are CamelCase and singular.
 - `Group Names` must be lower case and be a valid DNS subdomains.

-----

##### Types(Kinds)
1. **Objects** - represent a persistent entity in the system.
  - An object may have multiple resources that clients can use to perform specific actions such as create, update, delete or get.
  - All API objects have common metadata.
    - ```go
      metav1.TypeMeta `json:",inline"`
      metav1.ObjectMeta `json:"metadata,omitempty" protobuf:"bytes,1,opt,name=metadata"`
      ``` 
    - Examples:
      - [Pod](https://github.com/kubernetes/kubernetes/blob/c33bbbc40baa26c6fed868638bd9ec7431406144/staging/src/k8s.io/api/core/v1/types.go), `ReplicationController`, `Service`, `Namespace`, `Node`.
        ```go
        type Pod struct {
        	metav1.TypeMeta `json:",inline"`
        	metav1.ObjectMeta `json:"metadata,omitempty" protobuf:"bytes,1,opt,name=metadata"`
        	Spec PodSpec `json:"spec,omitempty" protobuf:"bytes,2,opt,name=spec"`
        	Status PodStatus `json:"status,omitempty" protobuf:"bytes,3,opt,name=status"`
        }
        ```

2. **Lists** - are collection of `resources` of one or more kinds.
  - The name of a list kind must end with `List`. [`(ConfigMapList, EndpointsList, EventList etc)`](https://github.com/kubernetes/kubernetes/blob/c33bbbc40baa26c6fed868638bd9ec7431406144/staging/src/k8s.io/api/core/v1/types.go)
  - Lists have a limited set of common metadata.
  - ```go
    metav1.TypeMeta `json:",inline"`
    metav1.ListMeta `json:"metadata,omitempty" protobuf:"bytes,1,opt,name=metadata"`  
    ```
  - All lists use the required `items` field to contain the array of objects they return.
  ```go
    // NodeList is the whole list of all Nodes which have been registered with master.
    type NodeList struct {
    	metav1.TypeMeta `json:",inline"`
    	// Standard list metadata.
    	// More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    	// +optional
    	metav1.ListMeta `json:"metadata,omitempty" protobuf:"bytes,1,opt,name=metadata"`
    
    	// List of nodes
    	Items []Node `json:"items" protobuf:"bytes,2,rep,name=items"`
    }
  ```
  - Any kind that has `items` field must be a list kind.
  - All lists that return objects with labels should support [label filtering](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/) and most lists should support [filtering by fields](https://kubernetes.io/docs/concepts/overview/working-with-objects/field-selectors/).
  - Examples: [`PodLists`, `ServiceLists`, `NodeLists`](https://github.com/kubernetes/api/blob/master/core/v1/types.go).
  
3. **Simple** - kinds are used for specific actions on objects and for non-persistent entities.
  - They have the same set of limited common metadata as `lists`.
  - For instance, the [`Status`](https://github.com/kubernetes/apimachinery/blob/master/pkg/apis/meta/v1/types.go) kind is returned when errors occur and is not persisted in the system.
  ```go
    // Status is a return value for calls that don't return other objects.
    type Status struct {
        TypeMeta `json:",inline"`
        ListMeta `json:"metadata,omitempty" protobuf:"bytes,1,opt,name=metadata"`
        Status string `json:"status,omitempty" protobuf:"bytes,2,opt,name=status"`
        Message string `json:"message,omitempty" protobuf:"bytes,3,opt,name=message"`
        Reason StatusReason `json:"reason,omitempty" protobuf:"bytes,4,opt,name=reason,casttype=StatusReason"`
        Details *StatusDetails `json:"details,omitempty" protobuf:"bytes,5,opt,name=details"`
        Code int32 `json:"code,omitempty" protobuf:"varint,6,opt,name=code"`
    }
  ```
  - Many simple resources are `subresources`, which are rooted at API paths of specific resources.
  - When resources wish to expose alternative actions or views that are closely coupled to a single resource, then should do so using new [`sub-resources`](resources.md). 
  ```bash
  - pods/attach 
  - pods/binding 
  - pods/eviction 
  - pods/exec 
  - pods/log 
  - pods/portforward 
  - pods/proxy 
  - pods/status
  ```
  For example POD sub-resources could be found here - `https://github.com/kubernetes/kubernetes/tree/master/pkg/registry/core/pod`   
  
  - [attach, exec, proforward, proxy](https://github.com/kubernetes/kubernetes/blob/master/pkg/registry/core/pod/rest/subresources.go )
  - [binding, status](https://github.com/kubernetes/kubernetes/blob/master/pkg/registry/core/pod/storage/storage.go)
  - [log](https://github.com/kubernetes/kubernetes/blob/master/pkg/registry/core/pod/rest/log.go)
  - [eviction](https://github.com/kubernetes/kubernetes/blob/master/pkg/registry/core/pod/storage/eviction.go)
  - Common sub-resources include:
    - `/binding`: Used to bind a resource representing a user request(e.g. Pod, PersistentVolumeClaim) to a cluster infrastructure resource (e.g. Node, PersistentVolume).
    - `/status`: Used to write just the status portion of a resource. For example, the `/pods` endpoint only allows updates to `metdata` and `spec`, since those reflect end-user intent. An automated process should be able to modify status for users to see by sending an updated Pod kind to server to the `pods/<name>/status` endpoint - the alternative endpoint allows different rules to be applied to the update, and access to be appropriately restricted.
    - `/scale`: Used to read and write the count of a resource in a manner that is independent of the specific resource schema.
    - The additional subresources, `proxy` and `portforward`, provide access to cluster resources as     
    
  - A common set of `meta` API objects are used across all API groups and are thus considered part of the API group named `meta.k8s.io`.
    - These types may evolve independent of the API group that uses them.
    - API servers may allow them to be addressed in their generic form.       
    - API groups (`$ kubectl api-resources`) 
      - https://github.com/kubernetes/kubernetes/tree/master/pkg/apis
      - https://github.com/kubernetes/apiextensions-apiserver/tree/master/pkg/apis/apiextensions
      - https://github.com/kubernetes/kube-aggregator/tree/master/pkg/apis/apiregistration 
      - List of API Groups:
        ```
        admissionregistration.k8s.io
        apiextensions.k8s.io 
        apiregistration.k8s.io 
        apps
        authentication.k8s.io
        authorization.k8s.io
        autoscaling
        batch
        certificates.k8s.io
        coordination.k8s.io
        events.k8s.io
        extensions
        networking.k8s.io
        node.k8s.io
        policy
        rbac.authorization.k8s.io
        scheduling.k8s.io
        storage.k8s.io
        ```
    - List of `meta` API objects https://github.com/kubernetes/apimachinery/blob/master/pkg/apis/meta/v1/types.go:
      - ListOptions
      - DeleteOptions
      - List
      - Status
      - WatchEvent https://github.com/kubernetes/apimachinery/blob/master/pkg/apis/meta/v1/watch.go
      - Scale https://github.com/kubernetes/kubernetes/blob/master/pkg/apis/autoscaling/types.go
  
  - The term `kind` is reserved for these `top-level` API types.
  - The term `type` should be used for distinguishing `sub-categories` within `objects` or `subobjects`.

-----
[Example](pod_example.yaml): POD object in yaml format.
##### Resources
All JSON objects returned by API must have following [fields](https://github.com/kubernetes/apimachinery/blob/master/pkg/apis/meta/v1/types.go#L41):
1. `kind`: string that identifies the schema this object should have. e.g. - `Deployment`, `DaemonSet`, `Job` etc. Look `$kubectl  api-resources`
2. `apiVersion`: a string that identifies the version of the schema that object should have. `v1alpha`, `v1alpha1`, `v1alpha2`..., `v1beta1`, `v1beta2`..., `v1`, `v2alpha`...

##### Objects

###### Metadata: 
- Every object kind MUST have following metadata in a nested object field called "metadata".
  - namespace, name, uid
- Every object SHOULD have the following metadata in a nested object field called "metadata".
  - resourceVersion, generation, creationTimestamp, deletionTimestamp, deletionTimestamp, labels, annotations.
  
##### Spec and Status
   
 
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 -----
 [ref](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#types-kinds)    