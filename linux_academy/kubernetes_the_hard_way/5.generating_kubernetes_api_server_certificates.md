##### Back to [Index](README.md)

---

##### Generating the Kubernetes API Server Certificate

1. Server certificates for the `Kubernetes API`.
  - Will generate one, signed with all of the hostnames and IPs that may be used later in order to access the `Kubernetes API`.

```bash
CERT_HOSTNAME=10.32.0.1,<controller node 1 Private IP>,<controller node 1 hostname>,<controller node 2 Private IP>,<controller node 2 hostname>,<API load balancer hostname>,127.0.0.1,localhostname,kubernetes.default
```

- 10.32.0.1 - is a standard IP that some Pod within the kubernetes cluster might wind up using in order to access the Kubernetes API internally.
  - Its not an external IP address, its just an IP address which may be used in some scenarios within the kubernetes cluster itself.

- kubernetes.default - Kubernetes internal hostname.

```bash
~/kthw$ CERT_HOSTNAME=10.32.0.1,172.31.42.63,tanalam1c.mylabserver.com,172.31.32.167,tanalam2c.mylabserver.com,172.31.46.223,tanalam5c.mylabserver.com,127.0.0.1,localhost,kubernetes.default

~/kthw$ {
> 
> cat > kubernetes-csr.json << EOF
> {
>   "CN": "kubernetes",
>   "key": {
>     "algo": "rsa",
>     "size": 2048
>   },
>   "names": [
>     {
>       "C": "US",
>       "L": "Portland",
>       "O": "Kubernetes",
>       "OU": "Kubernetes The Hard Way",
>       "ST": "Oregon"
>     }
>   ]
> }
> EOF
> 
> cfssl gencert \
>   -ca=ca.pem \
>   -ca-key=ca-key.pem \
>   -config=ca-config.json \
>   -hostname=${CERT_HOSTNAME} \
>   -profile=kubernetes \
>   kubernetes-csr.json | cfssljson -bare kubernetes
> 
> }
2020/03/15 04:52:38 [INFO] generate received request
2020/03/15 04:52:38 [INFO] received CSR
2020/03/15 04:52:38 [INFO] generating key: rsa-2048
2020/03/15 04:52:38 [INFO] encoded CSR
2020/03/15 04:52:38 [INFO] signed certificate with serial number 662925427159997897336706015295273464493443960769
``` 

These are the server certificates which will provide a TLS (secure HTTP) connection to Kubernetes API.

```bash
~/kthw$ ls -1 | grep -i kubernetes
kubernetes.csr
kubernetes-csr.json
kubernetes-key.pem
kubernetes.pem
```
