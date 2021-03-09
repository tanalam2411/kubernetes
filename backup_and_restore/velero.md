##### VELERO
- K8s Backup, Restore, Migration Use Cases

- Disaster Recovery
  - Rebuild
  - Restore
  - Recover
  - Reduces time to recovery in case of infrastructure loss, data corruption, and/or service outages
  
- Data Protection
  - Data loss
  - Data Corruption
  - Archival Retention
  
- Data Migration
  - Move from one platform to another Kubernetes Upgrades
  - Hydrate dev, test, and staging envs
  - Enables cluster portability by easily migrating kubernetes resources from one cluster to another
  - Integrates with DevOps workflows to create ephermeral clones of kubernetes namespaces
  
- Ephemeral Cluster
  - Provides a reliable tool to unlock new approaches to cluster lifecycle management treating clusters as cattle.
  
  
- Strategies for k8s Stateful Data
  - etcd
    - Block
    - File system
    - etcdctl
    - k8s API discovery
    
  - Persistent Volumes
    - Cloud/Storage provider snapshots 
    - File system backup
    - CSI snapshots
    
    
- Velero Features
  - Backup and restores of k8s objects
    - uses k8s discovery API
    - Does not talk directly to etcd
    - Backups stored in Cloud Object Storage
  - Backup and restore persistent volumes
    - uses cloud provider snapshot APIs
    
  - Flexibility
    - Scheduled backups
    - Filtering
      - Namespaces
      - Resources
      - Label Selectors
    - Restore to different namespaces
    
  - Extensibility
    - Hooks
    - Plugins
      - Object Storage
      - Block Storage
      - Item Backup Actions
      - Item Restore Actions    
        
              

