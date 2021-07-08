
- Each pod is assigned an IP Address on the Pod network when it's deployed
- Pod network spans all nodes in the cluster
- Pod network uss the `10.128.0.0/14` classless inter-domain routing(CIDR)
- Each node in the cluster is assigned a `/23` CIDR IP address range from the pod network block.
- Means each node can accommodate maximum of 512 pods
- IP ranges for each node is controlled by `OpenFlow`(SDN Standard)
- OpenFlow is a SDN control-plane manager that OpenShift uses to route network traffic in the cluster without having to change the configuration of the host's networking stack.
- The interfaces on the nodes that make uo the pod network and also the encrypted connections between nodes, are created and managed by `Open vSwitch (OVS)`
- Combined with the `iptables firewall` on each host, open flow and OVS are collectively referred as OpenShift SDN network plugin.

##### Open vSwitch
- OVS is an enterprise-grade, scalable, high performance SDN and it's the default SND for OpenShift, used to create the pod network in your cluster.
- OVS runs as a service on each node in the cluster (`systemctl status ovs-vswitched`).

- Apart from the default `lo` loopback and `eth0` physical interface, OVC creates additional virtual interfaces to route traffic
- `br0` - OVS bridge, is created when the node is added to the OpenShift cluster
- `tun0` - Attached to `br0`, act as a default gateway to each node. 
  - Traffic in and out of your OpenShift cluster is routed through this interface.
- `vxlan_sys_4789` - Also attached to br0. 
  - This virtual extensible local area network (VXLAN) is encrypted and used to route traffic to containers on other nodes in your cluster. 
  - It connects the nodes in your OpenShift cluster to create your Pod network.
  - A VXLAN is a protocol that acts as an overlay network between the nodes in your OpenShift cluster. 
  - The overlay network is the pod network in your OpenShift cluster. 
- `veth` - Each pod has a corresponding virtual Ethernet(veth) interface that's linked to the `eth0` interface in the pod by linux kernel.
  



























---

Ref:
- Openshift in Action