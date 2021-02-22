

- Cluster API
  - Management Cluster(Boostrap or ephemeral cluster): Is a temporary clustor i which Cluster API and other components(controllers) gets deployed.
    - Using bootstrap cluster we can create our target cluster(cloud or baremetal)
    
- Metal3: extended Cluster API support for Baremetal(metalkube) infra.     

--- 

1. Node: k8s cluster node.
2. Machine: Cluster API object responsible to create actual VM on based on the machine CRD resource.
3. Baremetal operator: Does the actual baremetal management of real servers or baremetals. 

  Node -> Machine -> Baremetal Operator -> Baremetal server
   
4. CRDs:
  - Metal3Cluster: ControlPlane endpoint details.
  - Metal3Machine: Node related details, such as image details, host selector, other metadata such as network configurations details etc
  - BareMetalHost: represents the actual physical server. This CRD includes details such as server address(libvirt://192. . . :6233/), credentials, image(e.g.: bionic image) for cloud init run. 
  
   