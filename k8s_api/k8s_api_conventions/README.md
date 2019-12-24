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

- **API Group**:
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
     