##### Back to [Index](README.md)

---

##### Generating Client Certificates

- Will generate the following client certificates:
  - admin
  - kube-proxy
  - kubelet (one for each worker node)
  - kube-controller-manager
  - kube-scheduler
  
1. Admin Client certificates:
  - You will see we have used `ca-key.pem` and `ca.pem` to sign this certificate.
```bash
~/kthw$ {
> 
> cat > admin-csr.json << EOF
> {
>   "CN": "admin",
>   "key": {
>     "algo": "rsa",
>     "size": 2048
>   },
>   "names": [
>     {
>       "C": "US",
>       "L": "Portland",
>       "O": "system:masters",
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
>   -profile=kubernetes \
>   admin-csr.json | cfssljson -bare admin
> 
> }
2020/03/15 02:27:45 [INFO] generate received request
2020/03/15 02:27:45 [INFO] received CSR
2020/03/15 02:27:45 [INFO] generating key: rsa-2048
2020/03/15 02:27:45 [INFO] encoded CSR
2020/03/15 02:27:45 [INFO] signed certificate with serial number 455095881255646678529990126159035023399803790465
2020/03/15 02:27:45 [WARNING] This certificate lacks a "hosts" field. This makes it unsuitable for
websites. For more information see the Baseline Requirements for the Issuance and Management
of Publicly-Trusted Certificates, v.1.1.6, from the CA/Browser Forum (https://cabforum.org);
specifically, section 10.2.3 ("Information Requirements").
```  

- This will generate the admin certificates:

```bash
~/kthw$ ls -1 | grep admin
admin.csr
admin-csr.json
admin-key.pem
admin.pem

```


2. Kubelet Client certificates:

```bash
~/kthw$ WORKER0_HOST=tanalam3c.mylabserver.com
~/kthw$ WORKER0_IP=172.31.44.236
~/kthw$ WORKER1_HOST=tanalam4c.mylabserver.com
~/kthw$ WORKER1_IP=172.31.45.31
```

```bash
~/kthw$ {
> cat > ${WORKER0_HOST}-csr.json << EOF
> {
>   "CN": "system:node:${WORKER0_HOST}",
>   "key": {
>     "algo": "rsa",
>     "size": 2048
>   },
>   "names": [
>     {
>       "C": "US",
>       "L": "Portland",
>       "O": "system:nodes",
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
>   -hostname=${WORKER0_IP},${WORKER0_HOST} \
>   -profile=kubernetes \
>   ${WORKER0_HOST}-csr.json | cfssljson -bare ${WORKER0_HOST}
> 
> cat > ${WORKER1_HOST}-csr.json << EOF
> {
>   "CN": "system:node:${WORKER1_HOST}",
>   "key": {
>     "algo": "rsa",
>     "size": 2048
>   },
>   "names": [
>     {
>       "C": "US",
>       "L": "Portland",
>       "O": "system:nodes",
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
>   -hostname=${WORKER1_IP},${WORKER1_HOST} \
>   -profile=kubernetes \
>   ${WORKER1_HOST}-csr.json | cfssljson -bare ${WORKER1_HOST}
> 
> }
2020/03/15 04:18:46 [INFO] generate received request
2020/03/15 04:18:46 [INFO] received CSR
2020/03/15 04:18:46 [INFO] generating key: rsa-2048
2020/03/15 04:18:46 [INFO] encoded CSR
2020/03/15 04:18:46 [INFO] signed certificate with serial number 405425008407330216756529409135523652222448762485
2020/03/15 04:18:46 [INFO] generate received request
2020/03/15 04:18:46 [INFO] received CSR
2020/03/15 04:18:46 [INFO] generating key: rsa-2048
2020/03/15 04:18:47 [INFO] encoded CSR
2020/03/15 04:18:47 [INFO] signed certificate with serial number 16939823603661196784409454081348891465014968470
```

```bash
~/kthw$ ls -1 | grep mylab
tanalam3c.mylabserver.com.csr
tanalam3c.mylabserver.com-csr.json
tanalam3c.mylabserver.com-key.pem
tanalam3c.mylabserver.com.pem
tanalam4c.mylabserver.com.csr
tanalam4c.mylabserver.com-csr.json
tanalam4c.mylabserver.com-key.pem
tanalam4c.mylabserver.com.pem\
```


3. Controller Manager certificates:

```bash
~/kthw$ {
> 
> cat > kube-controller-manager-csr.json << EOF
> {
>   "CN": "system:kube-controller-manager",
>   "key": {
>     "algo": "rsa",
>     "size": 2048
>   },
>   "names": [
>     {
>       "C": "US",
>       "L": "Portland",
>       "O": "system:kube-controller-manager",
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
>   -profile=kubernetes \
>   kube-controller-manager-csr.json | cfssljson -bare kube-controller-manager
> 
> }
2020/03/15 04:24:54 [INFO] generate received request
2020/03/15 04:24:54 [INFO] received CSR
2020/03/15 04:24:54 [INFO] generating key: rsa-2048
2020/03/15 04:24:55 [INFO] encoded CSR
2020/03/15 04:24:55 [INFO] signed certificate with serial number 706602162459534175222827824383683013359817725258
2020/03/15 04:24:55 [WARNING] This certificate lacks a "hosts" field. This makes it unsuitable for
websites. For more information see the Baseline Requirements for the Issuance and Management
of Publicly-Trusted Certificates, v.1.1.6, from the CA/Browser Forum (https://cabforum.org);
specifically, section 10.2.3 ("Information Requirements").
```

```bash
~/kthw$ ls -1 | grep controller
kube-controller-manager.csr
kube-controller-manager-csr.json
kube-controller-manager-key.pem
kube-controller-manager.pem
```

4. Kube Proxy certificates:
```bash
~/kthw$ {
> 
> cat > kube-proxy-csr.json << EOF
> {
>   "CN": "system:kube-proxy",
>   "key": {
>     "algo": "rsa",
>     "size": 2048
>   },
>   "names": [
>     {
>       "C": "US",
>       "L": "Portland",
>       "O": "system:node-proxier",
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
>   -profile=kubernetes \
>   kube-proxy-csr.json | cfssljson -bare kube-proxy
> 
> }
2020/03/15 04:26:34 [INFO] generate received request
2020/03/15 04:26:34 [INFO] received CSR
2020/03/15 04:26:34 [INFO] generating key: rsa-2048
2020/03/15 04:26:34 [INFO] encoded CSR
2020/03/15 04:26:34 [INFO] signed certificate with serial number 95358522218682624108224220133882389992081084615
2020/03/15 04:26:34 [WARNING] This certificate lacks a "hosts" field. This makes it unsuitable for
websites. For more information see the Baseline Requirements for the Issuance and Management
of Publicly-Trusted Certificates, v.1.1.6, from the CA/Browser Forum (https://cabforum.org);
specifically, section 10.2.3 ("Information Requirements").
```

```bash
~/kthw$ ls -1 | grep proxy
kube-proxy.csr
kube-proxy-csr.json
kube-proxy-key.pem
kube-proxy.pem
```

5. Kube Scheduler Client certificates:

```bash
~/kthw$ {
> 
> cat > kube-scheduler-csr.json << EOF
> {
>   "CN": "system:kube-scheduler",
>   "key": {
>     "algo": "rsa",
>     "size": 2048
>   },
>   "names": [
>     {
>       "C": "US",
>       "L": "Portland",
>       "O": "system:kube-scheduler",
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
>   -profile=kubernetes \
>   kube-scheduler-csr.json | cfssljson -bare kube-scheduler
> 
> }
2020/03/15 04:29:12 [INFO] generate received request
2020/03/15 04:29:12 [INFO] received CSR
2020/03/15 04:29:12 [INFO] generating key: rsa-2048
2020/03/15 04:29:13 [INFO] encoded CSR
2020/03/15 04:29:13 [INFO] signed certificate with serial number 471445220165554070389626017675962380246124052764
2020/03/15 04:29:13 [WARNING] This certificate lacks a "hosts" field. This makes it unsuitable for
websites. For more information see the Baseline Requirements for the Issuance and Management
of Publicly-Trusted Certificates, v.1.1.6, from the CA/Browser Forum (https://cabforum.org);
specifically, section 10.2.3 ("Information Requirements").
```

```bash
~/kthw$ ls -1 | grep scheduler
kube-scheduler.csr
kube-scheduler-csr.json
kube-scheduler-key.pem
kube-scheduler.pem

```