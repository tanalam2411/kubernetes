

##### Resource Schema Components

- `GVK`: Group Version kind
  - ```yaml
    apiVersion: extentions/v1beta1
    kind: ReplicaSet
    ```
- Metadata/ObjectMeta
  - ```yaml
    metadata:
      name: rep-set
      namespace: n1
    ```  
- spec
  - ```yaml
    spec:
      selector:
        ...
    ```    
- status   
  - ```yaml
    replicas: 1
    ...
    ``` 
    
---

##### CustomResourceDefinition

```yaml
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: mysqls.db.example.com
spec:
  group: db.example.com
  scope: Namespaced
  names:
    plural: mysqls
    singular: mysql
    kind: MySql
    shortNames:
    - ms
  versions:
    - name: v1
      served: true
      storage: true
      schema:
        openAPIV3Schema:
          type: object
```     

```bash
yamls$ k create -f my-new-crd.yaml 
customresourcedefinition.apiextensions.k8s.io/mysqls.db.example.com created

yamls$ k get crds
NAME                    CREATED AT
mysqls.db.example.com   2021-04-13T10:20:38Z

```

- A `Custom Resource` needs a controller to ACT upon its presence.    

---

##### OwnerReferences
- Some Kubernetes objects are owners of other objects. For example, a ReplicaSet is the owner of a set of Pods. 
  - The owned objects are called dependents of the owner object. 
  - Every dependent object has a metadata.ownerReferences field that points to the owning object.
  
---

##### Informers/shared informers
- For object cache and event handling
- Communicating desired state/actual state via annotations
- Tracking kube-related resources
- Test scaffolding and repo organization  