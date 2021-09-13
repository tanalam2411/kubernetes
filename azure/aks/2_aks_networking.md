##### AKS Networking DeepDive

- POD has a unique address within the cluster
- POD can communicate with other PODs, without NATing, if they all have unique IP address.
- POD CIDR range shouldn't overlap with the underlying subnet.
- 
  | Network Plugin     | Subnet(IP)                                 | Azure N/W Configuration
  | ------------------ | ------------------------------------------ | ------------------------
  | KUBENET            | Managed                                    | Basic
  | AZURE CNI          | Bring You're Own IP(Create ur own VNET     | Advanced
  
 gdpr 
 plan
 backend
 
 create vm using teraform (backend.tf)