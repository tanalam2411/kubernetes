##### Back to [Index](README.md)

---


##### The Certificate Authority and Certificates

**Certificates** - are used to confirm(authenticate) identity. They are used to prove that you are who you say you are.

**Certificate Authority** - provides the ability to confirm that a certificate is valid. 
  - A `CA` can be used to validate any certificate that was issued using that `CA`.
  
---
  
##### Required Certificates   

After we provision the `CA`, we will need to generate certificates for the following:

- **Client Certificates** - These certificates provide client authentication for various users: admin, kube-controller-manager, kube-scheduler, kube-proxy, and the kubelet client on each worker node.

- **Kubernetes API Server Certificate** - This is the TLS certificate for the Kubernetes API.

- **Service Account Key Pair** - Kubernetes uses a certificate to sign service account, so we need to provide a certificate for that purpose. 