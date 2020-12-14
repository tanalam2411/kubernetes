##### CKA

- Service: https://kubernetes.io/docs/concepts/services-networking/service/
  - service nodeport
- Network Policy: https://kubernetes.io/docs/concepts/services-networking/network-policies/
  - network policy port
- ##### onfigure-upgrade-etcd - https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/
  - etcd snapsot
- ##### Upgrade cluster - https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/
  - upgrade all of the Kubernetes control plane
  - kubelet and kubectl on the master node 
- set node unavailable
  - https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/
  - https://kubernetes.io/docs/tasks/administer-cluster/safely-drain-node/
- ##### failed to provision volume with StorageClass "csi-hostpath-sc": error getting handle for DataSource Type VolumeSnapshot by Name pv-volume: error getting snapshot pv-volume from api server: volumesnapshots.snapshot.storage.k8s.io "pv-volume" not found
  - claimName, PersistentVolumeClaim
  - csi-hostpath-sc
  - hostPath
  - Volumes
  - Storage class
- CPU workloads: 
-  sidecar container to the existing Pod
- multi container POD - nginx  redis - https://kubernetes.io/docs/concepts/workloads/pods/ - https://kubernetes.io/search/?q=%20single%20app%20container
  -  single app container
- tainted NoSchedule: https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/
  - tainted
  - disk=spinning
  - reschedule: https://kubernetes.io/search/?q=reschedule
    - –node-monitor-grace-period duration
    - –pod-eviction-timeout duration
- Node selector: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/
- Ingress: https://kubernetes.io/docs/concepts/services-networking/ingress/
- Multicontainer - logging, sidecar
- Daemonsets

- Network Policy - https://github.com/kubernetes/kubernetes/issues/40413#issuecomment-643817204


- https://medium.com/@imarunrk/certified-kubernetes-administrator-cka-tips-and-tricks-part-3-2e7b44e89a3b
- https://medium.com/@imarunrk/certified-kubernetes-administrator-cka-tips-and-tricks-part-2-b4f5c636eb4
- https://medium.com/@imarunrk/certified-kubernetes-administrator-cka-tips-and-tricks-part-5-869d947412c0
- https://github.com/WahlNetwork/certified-kubernetes-administrator-cka-exam/blob/main/objectives/objective1.md#15-perform-a-version-upgrade-on-a-kubernetes-cluster-using-kubeadm