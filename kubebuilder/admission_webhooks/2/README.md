


- Create k8s cluster using minikube
```bash
 minikube start --extra-config=apiserver.enable-admission-plugins=MutatingAdmissionWebhook,ValidatingAdmissionWebhook
```











---
- Ref
  - https://istio.io/v1.3/docs/ops/setup/webhook/
  - https://kubernetes.io/docs/reference/command-line-tools-reference/kube-apiserver/
  