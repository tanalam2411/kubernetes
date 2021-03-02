
```bash
[rscloud@iceman ~]$ lscpu | grep -i virtualization
Virtualization:        VT-x


[rscloud@iceman ~]$ sudo yum install qemu-kvm libvirt libvirt-python libguestfs-tools virt-install -y


$ sudo systemctl status libvirtd
● libvirtd.service - Virtualization daemon
   Loaded: loaded (/usr/lib/systemd/system/libvirtd.service; enabled; vendor preset: enabled)
   Active: inactive (dead)
     Docs: man:libvirtd(8)
           https://libvirt.org

[rscloud@iceman ~]$ sudo systemctl enable libvirtd
[rscloud@iceman ~]$ sudo systemctl start libvirtd


[rscloud@iceman ~]$ sudo systemctl status libvirtd
● libvirtd.service - Virtualization daemon
   Loaded: loaded (/usr/lib/systemd/system/libvirtd.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2021-02-25 19:40:55 UTC; 19s ago

```

- By default dhcpd based network bridge configured by libvirtd. You can verify that with the following commands:
```bash
[rscloud@iceman ~]$ brctl show
bridge name	bridge id		STP enabled	interfaces
virbr0		8000.525400d27169	yes		virbr0-nic
[rscloud@iceman ~]$ sudo virsh net-list
 Name                 State      Autostart     Persistent
----------------------------------------------------------
 default              active     yes           yes


[rscloud@iceman ~]$ ip a
4: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 52:54:00:d2:71:69 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
       valid_lft forever preferred_lft forever
5: virbr0-nic: <BROADCAST,MULTICAST> mtu 1500 qdisc pfifo_fast master virbr0 state DOWN group default qlen 1000
    link/ether 52:54:00:d2:71:69 brd ff:ff:ff:ff:ff:ff

```


- Create VM 
```bash
[rscloud@iceman vms]$ tmpfile=$(mktemp /tmp/sushy-domain.XXXXXX)
[rscloud@iceman vms]$ echo $tmpfile
/tmp/sushy-domain.mtx56Q

rscloud@iceman vms]$ virt-install \
>    --name vbmc-node \
>    --ram 1024 \
>    --disk size=1 \
>    --vcpus 2 \
>    --os-type linux \
>    --os-variant fedora28 \
>    --graphics vnc \
>    --print-xml > $tmpfile

[rscloud@iceman vms]$ virsh list --all
 Id    Name                           State
----------------------------------------------------


```

```xml
[rscloud@iceman vms]$ cat $tmpfile
<domain type="kvm">
  <name>vbmc-node</name>
  <uuid>3a7236fd-9ac9-4ae6-a5af-35daf46a2a7d</uuid>
  <memory>1048576</memory>
  <currentMemory>1048576</currentMemory>
  <vcpu>2</vcpu>
  <os>
    <type arch="x86_64">hvm</type>
    <boot dev="hd"/>
  </os>
  <features>
    <acpi/>
    <apic/>
  </features>
  <cpu mode="custom" match="exact">
    <model>SandyBridge-IBRS</model>
    <feature policy="require" name="md-clear"/>
    <feature policy="require" name="spec-ctrl"/>
    <feature policy="require" name="ssbd"/>
  </cpu>
  <clock offset="utc">
    <timer name="rtc" tickpolicy="catchup"/>
    <timer name="pit" tickpolicy="delay"/>
    <timer name="hpet" present="no"/>
  </clock>
  <pm>
    <suspend-to-mem enabled="no"/>
    <suspend-to-disk enabled="no"/>
  </pm>
  <devices>
    <emulator>/usr/libexec/qemu-kvm</emulator>
    <disk type="file" device="disk">
      <driver name="qemu" type="qcow2"/>
      <source file="/home/rscloud/.local/share/libvirt/images/vbmc-node.qcow2"/>
      <target dev="vda" bus="virtio"/>
    </disk>
    <controller type="usb" index="0" model="ich9-ehci1"/>
    <controller type="usb" index="0" model="ich9-uhci1">
      <master startport="0"/>
    </controller>
    <controller type="usb" index="0" model="ich9-uhci2">
      <master startport="2"/>
    </controller>
    <controller type="usb" index="0" model="ich9-uhci3">
      <master startport="4"/>
    </controller>
    <interface type="user">
      <mac address="52:54:00:54:7e:20"/>
      <model type="virtio"/>
    </interface>
    <input type="tablet" bus="usb"/>
    <graphics type="vnc" port="-1"/>
    <console type="pty"/>
    <channel type="unix">
      <source mode="bind"/>
      <target type="virtio" name="org.qemu.guest_agent.0"/>
    </channel>
    <rng model="virtio">
      <backend model="random">/dev/urandom</backend>
    </rng>
  </devices>
</domain>
```

```bash
[rscloud@iceman vms]$ virsh list --all
 Id    Name                           State
----------------------------------------------------
 -     vbmc-node                      shut off


[rscloud@iceman vms]$ virsh dominfo --domain vbmc-node
Id:             -
Name:           vbmc-node
UUID:           3a7236fd-9ac9-4ae6-a5af-35daf46a2a7d
OS Type:        hvm
State:          shut off
CPU(s):         2
Max memory:     1048576 KiB
Used memory:    1048576 KiB
Persistent:     yes
Autostart:      disable
Managed save:   no
Security model: selinux
Security DOI:   0

```


---

```bash
[rscloud@iceman ws]$ python3 -m venv py3-venv
[rscloud@iceman ws]$ ll
total 0
drwxrwxr-x. 5 rscloud rscloud 74 Feb 25 20:17 py3-venv
drwxrwxr-x. 2 rscloud rscloud  6 Feb 25 19:57 vms

[rscloud@iceman ws]$ source py3-venv/bin/activate

(py3-venv) [rscloud@iceman ws]$ python -V
Python 3.6.8

(py3-venv) [rscloud@iceman ws]$ git clone https://github.com/openstack/sushy-tools.git

(py3-venv) [rscloud@iceman ws]$ ls -1
py3-venv
sushy-tools
vms


(py3-venv) [rscloud@iceman ws]$ pip install -r requirements.txt

(py3-venv) [rscloud@iceman ws]$ export SUSHY_EMULATOR_CONFIG=/home/rscloud/ws/sushy-tools/doc/source/admin/emulator.conf

(py3-venv) [rscloud@iceman ws]$ python setup.py install


(py3-venv) [rscloud@iceman emulator]$ sudo yum group install "Development Tools" -y

(py3-venv) [rscloud@iceman ws]$ sudo yum install libvirt-devel -y

(py3-venv) [rscloud@iceman emulator]$ sudo yum install python-devel -y

(py3-venv) [rscloud@iceman emulator]$ sudo yum search python3 | grep devel
python3-devel.i686 : Libraries and header files needed for Python development
python3-devel.x86_64 : Libraries and header files needed for Python development
python3-idle.i686 : A basic graphical development environment for Python
python3-idle.x86_64 : A basic graphical development environment for Python

(py3-venv) [rscloud@iceman emulator]$ sudo yum install -y python3-devel.x86_64


(py3-venv) [rscloud@iceman ws]$ pip install libvirt-python
```

```bash
[rscloud@iceman ~]$ curl -d '{"ResetType":"On"}' \
>     -H "Content-Type: application/json" -X POST \
>      http://localhost:8000/redfish/v1/Systems/vbmc-node/Actions/ComputerSystem.Reset
{
  "error": {
    "code": "Base.1.0.GeneralError",
    "message": "Error when connecting to the libvirt URI \"qemu:///system\": authentication unavailable: no polkit agent available to authenticate action \u0027org.libvirt.unix.manage\u0027",
    "@Message.ExtendedInfo": [
      {
        "@odata.type": "/redfish/v1/$metadata#Message.1.0.0.Message",
        "MessageId": "Base.1.0.GeneralError"
      }
    ]
  }

# Fix 
(py3-venv) [rscloud@iceman ws]$ sudo usermod --append --groups libvirt `whoami`

```

- Added this in bashrc
```bash
[rscloud@iceman ~]$ tail -2 ~/.bashrc 
export SUSHY_EMULATOR_CONFIG=/home/rscloud/ws/sushy-tools/doc/source/admin/emulator.conf
alias rf='source /home/rscloud/ws/py3-venv/bin/activate && cd /home/rscloud/ws/sushy-tools/sushy_tools/emulator'

```

- Run redfish emulator in foreground
```bash
(py3-venv) [rscloud@iceman emulator]$ python main.py 
 * Serving Flask app "main" (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: on
 * Running on http://127.0.0.1:8000/ (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 125-230-089

```

- In another terminal:
  - Event though `virsh list --all` was showing one node, the API returns "Members": [] empty becaz the qemu URI `qemu:///system` works for root user.
  - So run the emulator app with root user. 
```bash
[rscloud@iceman ~]$ curl http://localhost:8000/redfish/v1/Systems/
{
    "@odata.type": "#ComputerSystemCollection.ComputerSystemCollection",
    "Name": "Computer System Collection",
    "Members@odata.count": 0,
    "Members": [
        
    ],
    "@odata.context": "/redfish/v1/$metadata#ComputerSystemCollection.ComputerSystemCollection",
    "@odata.id": "/redfish/v1/Systems",
    "@Redfish.Copyright": "Copyright 2014-2016 Distributed Management Task Force, Inc. (DMTF). For the full DMTF copyright policy, see http://www.dmtf.org/about/policies/copyright."
}
```


- Running with `root` user:
```bash
[root@iceman rscloud]# rf
(py3-venv) [root@iceman emulator]# python main.py 
 * Serving Flask app "main" (lazy loading)




[root@iceman rscloud]# virsh list --all
 Id    Name                           State
----------------------------------------------------
 -     vbmc-node                      shut off

[root@iceman rscloud]# curl http://localhost:8000/redfish/v1/Systems/
{
    "@odata.type": "#ComputerSystemCollection.ComputerSystemCollection",
    "Name": "Computer System Collection",
    "Members@odata.count": 1,
    "Members": [
        
            {
                "@odata.id": "/redfish/v1/Systems/ee026def-cc4f-4ce3-96a6-814cdc5a882f"
            }
        
    ],
    "@odata.context": "/redfish/v1/$metadata#ComputerSystemCollection.ComputerSystemCollection",
    "@odata.id": "/redfish/v1/Systems",
    "@Redfish.Copyright": "Copyright 2014-2016 Distributed Management Task Force, Inc. (DMTF). For the full DMTF copyright policy, see http://www.dmtf.org/about/policies/copyright."
}

[root@iceman rscloud]# virsh define --file $tmpfile
```
























---

- https://www.cyberciti.biz/faq/how-to-install-kvm-on-centos-7-rhel-7-headless-server/
- https://docs.openstack.org/sushy-tools/latest/install/index.html