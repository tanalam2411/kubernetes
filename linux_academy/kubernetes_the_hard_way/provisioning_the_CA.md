##### Back to [Index](README.md)

---

##### Provisioning the Certificate Authority

- `cfssl`, `cfssljson` need to be installed:
```bash
$ wget -q --show-progress --https-only --timestamping \
>   https://storage.googleapis.com/kubernetes-the-hard-way/cfssl/linux/cfssl \
>   https://storage.googleapis.com/kubernetes-the-hard-way/cfssl/linux/cfssljson
cfssl                               100%[=================================================================>]  19.62M  9.05MB/s    in 2.2s    
cfssljson                           100%[=================================================================>]  12.08M  5.20MB/s    in 2.3s    

$ chmod +x cfssl cfssljson

$ sudo mv cfssl /usr/local/bin/cfssl

$ sudo mv cfssljson /usr/local/bin/cfssljson
```


- Generating the `CA`:

```bash
~/kthw$ {
> 
> cat > ca-config.json << EOF
> {
>   "signing": {
>     "default": {
>       "expiry": "8760h"
>     },
>     "profiles": {
>       "kubernetes": {
>         "usages": ["signing", "key encipherment", "server auth", "client auth"],
>         "expiry": "8760h"
>       }
>     }
>   }
> }
> EOF
> 
> cat > ca-csr.json << EOF
> {
>   "CN": "Kubernetes",
>   "key": {
>     "algo": "rsa",
>     "size": 2048
>   },
>   "names": [
>     {
>       "C": "US",
>       "L": "Portland",
>       "O": "Kubernetes",
>       "OU": "CA",
>       "ST": "Oregon"
>     }
>   ]
> }
> EOF
> 
> cfssl gencert -initca ca-csr.json | cfssljson -bare ca
> 
> }
2020/03/14 23:02:09 [INFO] generating a new CA key and certificate from CSR
2020/03/14 23:02:09 [INFO] generate received request
2020/03/14 23:02:09 [INFO] received CSR
2020/03/14 23:02:09 [INFO] generating key: rsa-2048
2020/03/14 23:02:09 [INFO] encoded CSR
2020/03/14 23:02:09 [INFO] signed certificate with serial number 492504628697463925342689074898678935812095248577

```

```bash
~/kthw$ ll -lrta
total 28
drwxr-xr-x 30 afour afour 4096 Mar 14 22:49 ../
-rw-r--r--  1 afour afour  232 Mar 14 23:02 ca-config.json
-rw-r--r--  1 afour afour  211 Mar 14 23:02 ca-csr.json
-rw-r--r--  1 afour afour 1318 Mar 14 23:02 ca.pem
-rw-------  1 afour afour 1679 Mar 14 23:02 ca-key.pem
-rw-r--r--  1 afour afour 1005 Mar 14 23:02 ca.csr
drwxr-xr-x  2 afour afour 4096 Mar 14 23:02 ./

```

- `csr` - certificate signing request

- `ca-key.pem` - is the private certificate for my certificate authority.

- `ca.pem` - is the public certificate. 