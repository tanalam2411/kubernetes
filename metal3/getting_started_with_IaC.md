
- `IaC` (Infrastructure as Code) - Defining and controlling physical infrastructure with declarative templates.

- `IaaS` (Infrastructure as a Service) - Running cloud services on top of said physical servers, defining/controlling/scheduling cloud resources such as networks, containers and VMs through APIs and declartive templates

- `BMaaS` (Bare Metal as a Service) - Controlling physical servers as user schedulable resources

---

##### Controlling Hardware (Out of Band Management)

- IPMI

- Hardware BMC(iDrac, ILO) - common in datacenter computing

- VirtualBMC - uses libvirt to control VM using IPMI commands

- Features:
  - Power control
  - Adjust boot order  