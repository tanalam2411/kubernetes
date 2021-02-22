

[ClusterAPI](https://cluster-api.sigs.k8s.io/)


1. Clusterctl - The clusterctl CLI tool handles the lifecycle of a Cluster API management cluster.
  - https://cluster-api.sigs.k8s.io/clusterctl/overview.html
  ```bash
   clusterctl init \
    --core cluster-api:v0.3.11 \
    --bootstrap kubeadm:v0.3.11 \
    --control-plane kubeadm:v0.3.11 \
    --infrastructure metal3
  ```


2. Machine - represents a k8s node
  - Once the Machine object is created, Metal3 will create Metal3Machine object, and will be listened by the baremetal-operator which knows how to interact with the real physical machines

3. Baremetal host - manageing the baremetal host by Baremetal-operator

4. ManagementCluster - [BaremetalOperator + Ironic] + [Cluster-apiprovider-metal3]<->[Cluster API]  

5. Baremetal Operator:
  - Prerequisites: (To be provided in BareMetalHost)
    - Host Baseboard Management Controller (BMC) credentials, BMC address, certificates(if enabled)
    - Host MAC address
  - Boots using Ironic
  




---
1. BMC(Baseboard Management Controller) - Its a little embedded linux computer, sits on the motherboard and provides management and control functionality 
  - All servers have them, so you don't need a monitor, power button and keyboard.
  - These are provided by a separate Linux computer called a BMC
  - BMCs runs software developed by your BIOS vendor and OEM
  - Interface include
    - Web Interface
    - IPMI

2.  `IPMI` -  provides a way to manage a computer that may be powered off or otherwise unresponsive by using a network connection to the hardware rather than to an operating system or login shell.

3. [u-boot + Linux kernel] -> systemd -> [(flash, leds, sensor, host)(ssh, Python rocket)]

4. `Cloud-init`- will identify the cloud it is running on during boot, read any provided metadata from the cloud and initialize the system accordingly. This may involve setting up the network and storage devices to configuring SSH access key and many other aspects of a system. Later on the cloud-init will also parse and process any optional user or vendor data that was passed to the instance.

5. Centos cloud images - https://cloud.centos.org/centos/8/x86_64/images/
 
6. Sample `BareMetalHost` 
  - ```yaml
    ---
    apiVersion: v1
    kind: Secret
    metadata:
      name: node-1-bmc-secret
      namespace: metal3
    type: Opaque
    data: 
      username: YW.. // base64
      password: cf..
    ---
    apiVersiob: metal3.io/v1alpha1
    kind: BareMetalHost
    metadata:
      name: node-1
      namespace: metal3
    spec:
      online: true
      bootMACAddress:
      bootMode: legacy
      image: 
        checksum: https://cloud.centos.org/centos/8/x86_64/images/Centos-8.md5sum
        checksumType: md5
        format: qcow2
        url: https://cloud.centos.org/centos/8/x86_64/images/Centos-8-GenericCloud-8.2.2004-20200611.2.x86_64.qcow2
      bmc:
        address: ipmi://192.168.111.1:6230
        credentialsName: node-0-bmc-secret
      consumerRef:
        apiVersion: infrastructure.cluster.x.k8s.io/v1alpha4
        kind: Metal3Machine
        name: test1-controlplane-
        namespace: metal3
    ```
  - Ironic will start the temporary image using an iso that is called `epa ironic` python agent, that epa downloads the image and writes it to the disk and then reboot it from the disk.
    - It will also write the cloud init data
  - `spec.metadata` - data that we can provide which would be used to render the cloud init user data and network data
    - We can give data such as `name`, `hostname` other node details. 
  - `spec.networkData` - references to a secret, which contains network configuration that will be applied by cloud init on the nodes
    - Use when you don't want to pass network details in `userData`      
  - `online` - machine on OR off
  - `userData` -   cloud init core data given by user(create user, create run cmd, install packages)
  - Once the hosts gets boot up, the cloud init will kick in, and it will read the configurations written by Ironic on the disk
  - `rootDeviceHints` - in case of multiple disk, we can provide hints, where Ironic will write the image
    - ```yaml
        rootDeviceHints:
          deviceName: /dev/sda
      ```
      
---

1. Management Cluster - 
  - BMO: Baremetal Operator
  - CAPM3: Cluster-api-provider-metal3
  - CAPI: Cluster-api
  
  - Resources:
    - BareMetal Host
    - Metal3Machine
    - Metal3Cluster      
    
---
1.  PXE - Preboot Execution Environment