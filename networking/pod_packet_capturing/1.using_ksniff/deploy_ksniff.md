##### Deploying ksniff using podTCPDump.sh script

---

1. Create SCC by name `ksniff` with following definition:

```bash
[~]$ oc get scc ksniff -n ns2 -o yaml
allowHostDirVolumePlugin: true
allowHostIPC: true
allowHostNetwork: true
allowHostPID: true
allowHostPorts: true
allowPrivilegeEscalation: true
allowPrivilegedContainer: true
allowedCapabilities:
- '*'
allowedUnsafeSysctls:
- '*'
apiVersion: security.openshift.io/v1
defaultAddCapabilities: null
fsGroup:
  type: RunAsAny
groups: []
kind: SecurityContextConstraints
metadata:
  name: ksniff
priority: null
readOnlyRootFilesystem: false
requiredDropCapabilities: null
runAsUser:
  type: RunAsAny
seLinuxContext:
  type: RunAsAny
seccompProfiles:
- '*'
supplementalGroups:
  type: RunAsAny
users:
- system:serviceaccount:ns2:default
volumes:
- '*'

```

2. Create `.ksniff` directory in current user's home directory

```bash
[~]$ mkdir $HOME/.ksniff
[~]$ cd $HOME/.ksniff
[.ksniff]$ pwd
/home/tanveera/.ksniff
```

3. Download or copy `ksniff.zip` to this location `$HOME/.ksniff`

```bash
[.ksniff]$ curl -LO https://github.com/eldadru/ksniff/releases/download/v1.6.0/ksniff.zip
```

4. Unzip `ksniff.zip`

```bash

[.ksniff]$ unzip ksniff.zip
Archive:  ksniff.zip
  inflating: kubectl-sniff
  inflating: kubectl-sniff-windows
  inflating: kubectl-sniff-darwin
  inflating: static-tcpdump
  inflating: Makefile
  inflating: plugin.yaml
  inflating: LICENSE

```

5. Make the `podTCPDump.sh` executable

```bash
[.ksniff]$ chmod +x podTCPDump.sh
```

6. Check `podTCPDump.sh` help cmd

```bash

[.ksniff]$ ./podTCPDump.sh --help
podTCPDump.sh [-h] -- pod tcpdump

where:
    -h,  --help              help text
    -l,  --list              list all running sniff jobs
    -s,  --start-sniffing    start sniffing
        Options:
          -n, --namespace    target namespace
          -p, --pod          start sniffing for pod (either name or alias), if alias provided will start sniffing for all pods with the alias
          -o, --output-dir   output directory(default: ~/.ksniff), where tcpdump files will be generated(it will create folder by name tcpdump-data where pcap files will be stored
        Example:
          $ ./podTCPDump.sh --namespace=default --pod=nginx --output-dir=/tmp --start-sniffing

    -st, --stop-sniffing     stop sniffing
        Options:
          -n, --namespace    stop sniffing for all pods within provided namespace
          -o, --output-dir   output directory, where tcpdump files will be generated(is required for stopping sniff as it has all running pids)
        Example:
          $ ./podTCPDump.sh --namespace=default --output-dir=/tmp --stop-sniffing
```

7. Start sniffing

```bash
[.ksniff]$ ./podTCPDump.sh --namespace=ns1 --pod=nginx --start-sniffing
Starting packet sniff for pods: nginx within namespace: ns1
The tcpdump pcap files will be stored location: /home/tanveera/.ksniff/tcpdump-data/ns1/nginx/pcaps
Starting Sniff for pod: ns1-nginxs-170-pbmm8
[.ksniff]$
[.ksniff]$
[.ksniff]$ ./podTCPDump.sh --namespace=ns2 --pod=nginx --start-sniffing
Starting packet sniff for pods: nginx within namespace: ns2
The tcpdump pcap files will be stored location: /home/tanveera/.ksniff/tcpdump-data/ns2/nginx/pcaps
Starting Sniff for pod: ns2-nginxs-186-sx7z9
Starting Sniff for pod: ns2-nginxs-186-zhv48
[.ksniff]$
[.ksniff]$ ./podTCPDump.sh --list
26100 -p /home/tanveera/.ksniff/tcpdump-data/ns1/nginx/pcaps/ns1-nginxs-170-pbmm8.pcap
26203 -p /home/tanveera/.ksniff/tcpdump-data/ns2/nginx/pcaps/ns2-nginxs-186-sx7z9.pcap
26207 -p /home/tanveera/.ksniff/tcpdump-data/ns2/nginx/pcaps/ns2-nginxs-186-zhv48.pcap
[.ksniff]$
[.ksniff]$
[.ksniff]$ tree ~/.ksniff/
/home/tanveera/.ksniff/
├── ksniff.zip
├── kubectl-sniff
├── kubectl-sniff-darwin
├── kubectl-sniff-windows
├── LICENSE
├── Makefile
├── plugin.yaml
├── podTCPDump.sh
├── static-tcpdump
└── tcpdump-data
    ├── ns1
    │   └── nginx
    │       ├── pcaps
    │       │   └── ns1-nginxs-170-pbmm8.pcap
    │       ├── pids
    │       │   └── 26100
    │       └── sniffed_pods.txt
    └── ns2
        └── nginx
            ├── pcaps
            │   ├── ns2-nginxs-186-sx7z9.pcap
            │   └── ns2-nginxs-186-zhv48.pcap
            ├── pids
            │   ├── 26203
            │   └── 26207
            └── sniffed_pods.txt

```

8. Stop sniffing

```bash

[.ksniff]$ ./podTCPDump.sh --namespace=ns1 --pod=nginx --stop-sniffing
Stopping all packet sniff jobs within namespace: ns1
26100
Do you wish to delete this -ksniff-5tw8z pod? Yy|Nn: y
pod "ksniff-5tw8z" deleted
[.ksniff]$
[.ksniff]$ ./podTCPDump.sh --namespace=ns2 --pod=nginx --stop-sniffing
Stopping all packet sniff jobs within namespace: ns2
26203
26207
Do you wish to delete this -ksniff-889v4 pod? Yy|Nn: y
pod "ksniff-889v4" deleted
Do you wish to delete this -ksniff-jncpl pod? Yy|Nn: y
pod "ksniff-jncpl" deleted

```