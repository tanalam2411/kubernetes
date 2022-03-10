##### Installing Istio - https://istio.io/latest/docs/setup/install/istioctl/


```bash
curl -L https://istio.io/downloadIstio | sh -
export PATH=~/istio-1.13.0/bin:$PATH
```

```bash
$ tree istio-1.13.0/
istio-1.13.0/
|-- LICENSE
|-- README.md
|-- bin
|   `-- istioctl
|-- manifest.yaml
|-- manifests
|   |-- charts
|   |   |-- README.md
|   |   |-- UPDATING-CHARTS.md
|   |   |-- base
|   |   |   |-- Chart.yaml
|   |   |   |-- README.md
|   |   |   |-- crds
|   |   |   |   |-- crd-all.gen.yaml
|   |   |   |   `-- crd-operator.yaml
|   |   |   |-- files
|   |   |   |   `-- gen-istio-cluster.yaml
|   |   |   |-- kustomization.yaml
|   |   |   |-- templates
|   |   |   |   |-- NOTES.txt
|   |   |   |   |-- clusterrole.yaml
|   |   |   |   |-- clusterrolebinding.yaml
|   |   |   |   |-- crds.yaml
|   |   |   |   |-- default.yaml
|   |   |   |   |-- endpoints.yaml
|   |   |   |   |-- reader-serviceaccount.yaml
|   |   |   |   |-- role.yaml
|   |   |   |   |-- rolebinding.yaml
|   |   |   |   |-- serviceaccount.yaml
|   |   |   |   `-- services.yaml
|   |   |   `-- values.yaml
|   |   |-- default
|   |   |   |-- Chart.yaml
|   |   |   |-- templates
|   |   |   |   |-- mutatingwebhook.yaml
|   |   |   |   `-- validatingwebhook.yaml
|   |   |   `-- values.yaml
|   |   |-- gateway
|   |   |   |-- Chart.yaml
|   |   |   |-- README.md
|   |   |   |-- templates
|   |   |   |   |-- NOTES.txt
|   |   |   |   |-- _helpers.tpl
|   |   |   |   |-- deployment.yaml
|   |   |   |   |-- hpa.yaml
|   |   |   |   |-- role.yaml
|   |   |   |   |-- service.yaml
|   |   |   |   `-- serviceaccount.yaml
|   |   |   |-- values.schema.json
|   |   |   `-- values.yaml
|   |   |-- gateways
|   |   |   |-- istio-egress
|   |   |   |   |-- Chart.yaml
|   |   |   |   |-- NOTES.txt
|   |   |   |   |-- templates
|   |   |   |   |   |-- _affinity.tpl
|   |   |   |   |   |-- autoscale.yaml
|   |   |   |   |   |-- deployment.yaml
|   |   |   |   |   |-- injected-deployment.yaml
|   |   |   |   |   |-- poddisruptionbudget.yaml
|   |   |   |   |   |-- role.yaml
|   |   |   |   |   |-- rolebindings.yaml
|   |   |   |   |   |-- service.yaml
|   |   |   |   |   `-- serviceaccount.yaml
|   |   |   |   `-- values.yaml
|   |   |   `-- istio-ingress
|   |   |       |-- Chart.yaml
|   |   |       |-- NOTES.txt
|   |   |       |-- templates
|   |   |       |   |-- _affinity.tpl
|   |   |       |   |-- autoscale.yaml
|   |   |       |   |-- deployment.yaml
|   |   |       |   |-- injected-deployment.yaml
|   |   |       |   |-- poddisruptionbudget.yaml
|   |   |       |   |-- role.yaml
|   |   |       |   |-- rolebindings.yaml
|   |   |       |   |-- service.yaml
|   |   |       |   `-- serviceaccount.yaml
|   |   |       `-- values.yaml
|   |   |-- install-OpenShift.md
|   |   |-- istio-cni
|   |   |   |-- Chart.yaml
|   |   |   |-- README.md
|   |   |   |-- templates
|   |   |   |   |-- NOTES.txt
|   |   |   |   |-- clusterrole.yaml
|   |   |   |   |-- clusterrolebinding.yaml
|   |   |   |   |-- configmap-cni.yaml
|   |   |   |   |-- daemonset.yaml
|   |   |   |   |-- resourcequota.yaml
|   |   |   |   `-- serviceaccount.yaml
|   |   |   `-- values.yaml
|   |   |-- istio-control
|   |   |   `-- istio-discovery
|   |   |       |-- Chart.yaml
|   |   |       |-- README.md
|   |   |       |-- files
|   |   |       |   |-- gateway-injection-template.yaml
|   |   |       |   |-- gen-istio.yaml
|   |   |       |   |-- grpc-agent.yaml
|   |   |       |   |-- grpc-simple.yaml
|   |   |       |   `-- injection-template.yaml
|   |   |       |-- kustomization.yaml
|   |   |       |-- templates
|   |   |       |   |-- NOTES.txt
|   |   |       |   |-- autoscale.yaml
|   |   |       |   |-- clusterrole.yaml
|   |   |       |   |-- clusterrolebinding.yaml
|   |   |       |   |-- configmap-jwks.yaml
|   |   |       |   |-- configmap.yaml
|   |   |       |   |-- deployment.yaml
|   |   |       |   |-- istiod-injector-configmap.yaml
|   |   |       |   |-- mutatingwebhook.yaml
|   |   |       |   |-- poddisruptionbudget.yaml
|   |   |       |   |-- reader-clusterrole.yaml
|   |   |       |   |-- reader-clusterrolebinding.yaml
|   |   |       |   |-- revision-tags.yaml
|   |   |       |   |-- role.yaml
|   |   |       |   |-- rolebinding.yaml
|   |   |       |   |-- service.yaml
|   |   |       |   |-- serviceaccount.yaml
|   |   |       |   |-- telemetryv2_1.11.yaml
|   |   |       |   |-- telemetryv2_1.12.yaml
|   |   |       |   |-- telemetryv2_1.13.yaml
|   |   |       |   `-- validatingwebhookconfiguration.yaml
|   |   |       `-- values.yaml
|   |   |-- istio-operator
|   |   |   |-- Chart.yaml
|   |   |   |-- crds
|   |   |   |   `-- crd-operator.yaml
|   |   |   |-- files
|   |   |   |   `-- gen-operator.yaml
|   |   |   |-- templates
|   |   |   |   |-- clusterrole.yaml
|   |   |   |   |-- clusterrole_binding.yaml
|   |   |   |   |-- crds.yaml
|   |   |   |   |-- deployment.yaml
|   |   |   |   |-- service.yaml
|   |   |   |   `-- service_account.yaml
|   |   |   `-- values.yaml
|   |   `-- istiod-remote
|   |       |-- Chart.yaml
|   |       |-- NOTES.txt
|   |       |-- files
|   |       |   |-- gateway-injection-template.yaml
|   |       |   `-- injection-template.yaml
|   |       |-- templates
|   |       |   |-- clusterrole.yaml
|   |       |   |-- clusterrolebinding.yaml
|   |       |   |-- configmap.yaml
|   |       |   |-- crd-all.gen.yaml
|   |       |   |-- crd-operator.yaml
|   |       |   |-- endpoints.yaml
|   |       |   |-- istiod-injector-configmap.yaml
|   |       |   |-- mutatingwebhook.yaml
|   |       |   |-- reader-clusterrole.yaml
|   |       |   |-- reader-clusterrolebinding.yaml
|   |       |   |-- reader-serviceaccount.yaml
|   |       |   |-- role.yaml
|   |       |   |-- rolebinding.yaml
|   |       |   |-- serviceaccount.yaml
|   |       |   |-- services.yaml
|   |       |   |-- telemetryv2_1.11.yaml
|   |       |   |-- telemetryv2_1.12.yaml
|   |       |   |-- telemetryv2_1.13.yaml
|   |       |   `-- validatingwebhookconfiguration.yaml
|   |       `-- values.yaml
|   |-- examples
|   |   |-- customresource
|   |   |   `-- istio_v1alpha1_istiooperator_cr.yaml
|   |   `-- user-gateway
|   |       `-- ingress-gateway-only.yaml
|   `-- profiles
|       |-- default.yaml
|       |-- demo.yaml
|       |-- empty.yaml
|       |-- external.yaml
|       |-- minimal.yaml
|       |-- openshift.yaml
|       |-- preview.yaml
|       `-- remote.yaml
|-- samples
|   |-- README.md
|   |-- addons
|   |   |-- README.md
|   |   |-- extras
|   |   |   |-- prometheus-operator.yaml
|   |   |   |-- prometheus_vm.yaml
|   |   |   |-- prometheus_vm_tls.yaml
|   |   |   `-- zipkin.yaml
|   |   |-- grafana.yaml
|   |   |-- jaeger.yaml
|   |   |-- kiali.yaml
|   |   `-- prometheus.yaml
|   |-- bookinfo
|   |   |-- README.md
|   |   |-- build_push_update_images.sh
|   |   |-- networking
|   |   |   |-- bookinfo-gateway.yaml
|   |   |   |-- certmanager-gateway.yaml
|   |   |   |-- destination-rule-all-mtls.yaml
|   |   |   |-- destination-rule-all.yaml
|   |   |   |-- destination-rule-reviews.yaml
|   |   |   |-- egress-rule-google-apis.yaml
|   |   |   |-- fault-injection-details-v1.yaml
|   |   |   |-- virtual-service-all-v1.yaml
|   |   |   |-- virtual-service-details-v2.yaml
|   |   |   |-- virtual-service-ratings-db.yaml
|   |   |   |-- virtual-service-ratings-mysql-vm.yaml
|   |   |   |-- virtual-service-ratings-mysql.yaml
|   |   |   |-- virtual-service-ratings-test-abort.yaml
|   |   |   |-- virtual-service-ratings-test-delay.yaml
|   |   |   |-- virtual-service-reviews-50-v3.yaml
|   |   |   |-- virtual-service-reviews-80-20.yaml
|   |   |   |-- virtual-service-reviews-90-10.yaml
|   |   |   |-- virtual-service-reviews-jason-v2-v3.yaml
|   |   |   |-- virtual-service-reviews-test-v2.yaml
|   |   |   |-- virtual-service-reviews-v2-v3.yaml
|   |   |   `-- virtual-service-reviews-v3.yaml
|   |   |-- platform
|   |   |   `-- kube
|   |   |       |-- README.md
|   |   |       |-- bookinfo-certificate.yaml
|   |   |       |-- bookinfo-db.yaml
|   |   |       |-- bookinfo-details-v2.yaml
|   |   |       |-- bookinfo-details.yaml
|   |   |       |-- bookinfo-ingress.yaml
|   |   |       |-- bookinfo-mysql.yaml
|   |   |       |-- bookinfo-ratings-discovery.yaml
|   |   |       |-- bookinfo-ratings-v2-mysql-vm.yaml
|   |   |       |-- bookinfo-ratings-v2-mysql.yaml
|   |   |       |-- bookinfo-ratings-v2.yaml
|   |   |       |-- bookinfo-ratings.yaml
|   |   |       |-- bookinfo-reviews-v2.yaml
|   |   |       |-- bookinfo.yaml
|   |   |       |-- cleanup.sh
|   |   |       `-- productpage-nodeport.yaml
|   |   |-- policy
|   |   |   `-- productpage_envoy_ratelimit.yaml
|   |   |-- src
|   |   |   |-- build-services.sh
|   |   |   |-- details
|   |   |   |-- mongodb
|   |   |   |   |-- ratings_data.json
|   |   |   |   `-- script.sh
|   |   |   |-- mysql
|   |   |   |-- productpage
|   |   |   |   |-- requirements.txt
|   |   |   |   |-- static
|   |   |   |   |   `-- bootstrap
|   |   |   |   |       |-- css
|   |   |   |   |       |-- fonts
|   |   |   |   |       `-- js
|   |   |   |   |-- templates
|   |   |   |   |-- test-requirements.txt
|   |   |   |   `-- tests
|   |   |   |       `-- unit
|   |   |   |-- ratings
|   |   |   |   `-- package.json
|   |   |   `-- reviews
|   |   |       |-- reviews-application
|   |   |       |   `-- src
|   |   |       |       |-- main
|   |   |       |       |   |-- java
|   |   |       |       |   |   `-- application
|   |   |       |       |   |       `-- rest
|   |   |       |       |   `-- webapp
|   |   |       |       |       `-- WEB-INF
|   |   |       |       `-- test
|   |   |       |           `-- java
|   |   |       |               `-- test
|   |   |       `-- reviews-wlpcfg
|   |   |           |-- servers
|   |   |           |   `-- LibertyProjectServer
|   |   |           |-- shared
|   |   |           `-- src
|   |   |               `-- test
|   |   |                   `-- java
|   |   |                       `-- it
|   |   |                           `-- rest
|   |   `-- swagger.yaml
|   |-- certs
|   |   |-- README.md
|   |   |-- ca-cert-alt.pem
|   |   |-- ca-cert.pem
|   |   |-- ca-key-alt.pem
|   |   |-- ca-key.pem
|   |   |-- cert-chain-alt.pem
|   |   |-- cert-chain.pem
|   |   |-- generate-workload.sh
|   |   |-- root-cert-alt.pem
|   |   |-- root-cert.pem
|   |   |-- workload-bar-cert.pem
|   |   |-- workload-bar-key.pem
|   |   |-- workload-foo-cert.pem
|   |   `-- workload-foo-key.pem
|   |-- custom-bootstrap
|   |   |-- README.md
|   |   |-- custom-bootstrap.yaml
|   |   `-- example-app.yaml
|   |-- extauthz
|   |   |-- README.md
|   |   |-- ext-authz.yaml
|   |   |-- local-ext-authz.yaml
|   |   `-- src
|   |       `-- Makefile
|   |-- external
|   |   |-- README.md
|   |   |-- aptget.yaml
|   |   |-- github.yaml
|   |   `-- pypi.yaml
|   |-- grpc-echo
|   |   |-- README.md
|   |   `-- grpc-echo.yaml
|   |-- health-check
|   |   |-- liveness-command.yaml
|   |   `-- liveness-http-same-port.yaml
|   |-- helloworld
|   |   |-- README.md
|   |   |-- gen-helloworld.sh
|   |   |-- helloworld-gateway.yaml
|   |   |-- helloworld.yaml
|   |   |-- loadgen.sh
|   |   `-- src
|   |       |-- build_service.sh
|   |       `-- requirements.txt
|   |-- httpbin
|   |   |-- README.md
|   |   |-- httpbin-gateway.yaml
|   |   |-- httpbin-nodeport.yaml
|   |   |-- httpbin-vault.yaml
|   |   |-- httpbin.yaml
|   |   `-- sample-client
|   |       `-- fortio-deploy.yaml
|   |-- jwt-server
|   |   |-- jwt-server.yaml
|   |   |-- src
|   |   |   `-- Makefile
|   |   `-- testdata
|   |-- kind-lb
|   |   |-- README.md
|   |   `-- setupkind.sh
|   |-- kubernetes-blog
|   |   |-- bookinfo-ratings.yaml
|   |   |-- bookinfo-reviews-v2.yaml
|   |   `-- bookinfo-v1.yaml
|   |-- multicluster
|   |   |-- README.md
|   |   |-- expose-istiod-https.yaml
|   |   |-- expose-istiod.yaml
|   |   |-- expose-services.yaml
|   |   `-- gen-eastwest-gateway.sh
|   |-- open-telemetry
|   |   |-- README.md
|   |   `-- otel.yaml
|   |-- operator
|   |   |-- cni-on.yaml
|   |   |-- default-install.yaml
|   |   |-- pilot-advanced-override.yaml
|   |   |-- pilot-k8s.yaml
|   |   |-- values-global.yaml
|   |   `-- values-pilot.yaml
|   |-- ratelimit
|   |   `-- rate-limit-service.yaml
|   |-- security
|   |   `-- psp
|   |       `-- sidecar-psp.yaml
|   |-- sleep
|   |   |-- README.md
|   |   |-- sleep-vault.yaml
|   |   `-- sleep.yaml
|   |-- tcp-echo
|   |   |-- README.md
|   |   |-- src
|   |   |-- tcp-echo-20-v2.yaml
|   |   |-- tcp-echo-all-v1.yaml
|   |   |-- tcp-echo-services.yaml
|   |   `-- tcp-echo.yaml
|   `-- websockets
|       |-- README.md
|       |-- app.yaml
|       `-- route.yaml
`-- tools
    |-- _istioctl
    |-- certs
    |   |-- Makefile.k8s.mk
    |   |-- Makefile.selfsigned.mk
    |   |-- README.md
    |   `-- common.mk
    `-- istioctl.bas
```

Istio Profiles - https://istio.io/latest/docs/setup/additional-setup/config-profiles/
```commandline

$ istioctl profile list
Istio configuration profiles:
    default
    demo
    empty
    external
    minimal
    openshift
    preview
    remote

```

Installing Istio with default profile
```commandline
$ istioctl install --set profile=default -y
✔ Istio core installed                                                                                                                                                                                     
✔ Istiod installed                                                                                                                                                                                         
✔ Ingress gateways installed                                                                                                                                                                               
✔ Installation complete                                                                                                                                                                                    Making this installation the default for injection and validation.

Thank you for installing Istio 1.13.  Please take a few minutes to tell us about your install/upgrade experience!  https://forms.gle/pzWZpAvMVBecaQ9h9

$ k get all -n istio-system
NAME                                        READY   STATUS    RESTARTS   AGE
pod/istio-ingressgateway-755d6cb48f-frxzh   1/1     Running   0          89s
pod/istiod-cddd697cf-f82zb                  1/1     Running   0          104s

NAME                           TYPE           CLUSTER-IP     EXTERNAL-IP    PORT(S)                                      AGE
service/istio-ingressgateway   LoadBalancer   10.0.183.246   20.100.44.20   15021:30289/TCP,80:32300/TCP,443:30680/TCP   89s
service/istiod                 ClusterIP      10.0.128.173   <none>         15010/TCP,15012/TCP,443/TCP,15014/TCP        104s

NAME                                   READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/istio-ingressgateway   1/1     1            1           90s
deployment.apps/istiod                 1/1     1            1           105s

NAME                                              DESIRED   CURRENT   READY   AGE
replicaset.apps/istio-ingressgateway-755d6cb48f   1         1         1       90s
replicaset.apps/istiod-cddd697cf                  1         1         1       105s

NAME                                                       REFERENCE                         TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
horizontalpodautoscaler.autoscaling/istio-ingressgateway   Deployment/istio-ingressgateway   5%/80%    1         5         1          90s
horizontalpodautoscaler.autoscaling/istiod                 Deployment/istiod                 0%/80%    1         5         1          105s
```


Installing addons:
```commandline
$ k apply -f istio-1.13.0/samples/addons/
extras/          grafana.yaml     jaeger.yaml      kiali.yaml       prometheus.yaml  README.md  


$ k apply -f istio-1.13.0/samples/addons/extras/
prometheus-operator.yaml  prometheus_vm_tls.yaml    prometheus_vm.yaml        zipkin.yaml      


$ k apply -f istio-1.13.0/samples/addons/kiali.yaml 
serviceaccount/kiali created
configmap/kiali created
clusterrole.rbac.authorization.k8s.io/kiali-viewer created
clusterrole.rbac.authorization.k8s.io/kiali created
clusterrolebinding.rbac.authorization.k8s.io/kiali created
role.rbac.authorization.k8s.io/kiali-controlplane created
rolebinding.rbac.authorization.k8s.io/kiali-controlplane created
service/kiali created
deployment.apps/kiali created


$ k apply -f istio-1.13.0/samples/addons/jaeger.yaml 
deployment.apps/jaeger created
service/tracing created
service/zipkin created
service/jaeger-collector created

```


```commandline
$ k get all -n istio-system
NAME                                        READY   STATUS    RESTARTS   AGE
pod/istio-ingressgateway-755d6cb48f-frxzh   1/1     Running   0          6m28s
pod/istiod-cddd697cf-f82zb                  1/1     Running   0          6m43s
pod/jaeger-9dd685668-spcdp                  1/1     Running   0          78s
pod/kiali-699f98c497-d6hd9                  1/1     Running   0          2m54s

NAME                           TYPE           CLUSTER-IP     EXTERNAL-IP    PORT(S)                                      AGE
service/istio-ingressgateway   LoadBalancer   10.0.183.246   20.100.44.20   15021:30289/TCP,80:32300/TCP,443:30680/TCP   6m28s
service/istiod                 ClusterIP      10.0.128.173   <none>         15010/TCP,15012/TCP,443/TCP,15014/TCP        6m43s
service/jaeger-collector       ClusterIP      10.0.43.197    <none>         14268/TCP,14250/TCP,9411/TCP                 77s
service/kiali                  ClusterIP      10.0.23.31     <none>         20001/TCP,9090/TCP                           2m56s
service/tracing                ClusterIP      10.0.183.205   <none>         80/TCP,16685/TCP                             78s
service/zipkin                 ClusterIP      10.0.118.11    <none>         9411/TCP                                     77s

NAME                                   READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/istio-ingressgateway   1/1     1            1           6m29s
deployment.apps/istiod                 1/1     1            1           6m44s
deployment.apps/jaeger                 1/1     1            1           79s
deployment.apps/kiali                  1/1     1            1           2m55s

NAME                                              DESIRED   CURRENT   READY   AGE
replicaset.apps/istio-ingressgateway-755d6cb48f   1         1         1       6m30s
replicaset.apps/istiod-cddd697cf                  1         1         1       6m45s
replicaset.apps/jaeger-9dd685668                  1         1         1       80s
replicaset.apps/kiali-699f98c497                  1         1         1       2m56s

NAME                                                       REFERENCE                         TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
horizontalpodautoscaler.autoscaling/istio-ingressgateway   Deployment/istio-ingressgateway   5%/80%    1         5         1          6m29s
horizontalpodautoscaler.autoscaling/istiod                 Deployment/istiod                 0%/80%    1         5         1          6m44s

```


Verify Istio installation:
```commandline
$ istioctl verify-install
1 Istio control planes detected, checking --revision "default" only
✔ HorizontalPodAutoscaler: istio-ingressgateway.istio-system checked successfully
✔ Deployment: istio-ingressgateway.istio-system checked successfully
✔ PodDisruptionBudget: istio-ingressgateway.istio-system checked successfully
✔ Role: istio-ingressgateway-sds.istio-system checked successfully
✔ RoleBinding: istio-ingressgateway-sds.istio-system checked successfully
✔ Service: istio-ingressgateway.istio-system checked successfully
✔ ServiceAccount: istio-ingressgateway-service-account.istio-system checked successfully
✔ ClusterRole: istiod-istio-system.istio-system checked successfully
✔ ClusterRole: istio-reader-istio-system.istio-system checked successfully
✔ ClusterRoleBinding: istio-reader-istio-system.istio-system checked successfully
✔ ClusterRoleBinding: istiod-istio-system.istio-system checked successfully
✔ ServiceAccount: istio-reader-service-account.istio-system checked successfully
✔ Role: istiod-istio-system.istio-system checked successfully
✔ RoleBinding: istiod-istio-system.istio-system checked successfully
✔ ServiceAccount: istiod-service-account.istio-system checked successfully
✔ CustomResourceDefinition: wasmplugins.extensions.istio.io.istio-system checked successfully
✔ CustomResourceDefinition: destinationrules.networking.istio.io.istio-system checked successfully
✔ CustomResourceDefinition: envoyfilters.networking.istio.io.istio-system checked successfully
✔ CustomResourceDefinition: gateways.networking.istio.io.istio-system checked successfully
✔ CustomResourceDefinition: proxyconfigs.networking.istio.io.istio-system checked successfully
✔ CustomResourceDefinition: serviceentries.networking.istio.io.istio-system checked successfully
✔ CustomResourceDefinition: sidecars.networking.istio.io.istio-system checked successfully
✔ CustomResourceDefinition: virtualservices.networking.istio.io.istio-system checked successfully
✔ CustomResourceDefinition: workloadentries.networking.istio.io.istio-system checked successfully
✔ CustomResourceDefinition: workloadgroups.networking.istio.io.istio-system checked successfully
✔ CustomResourceDefinition: authorizationpolicies.security.istio.io.istio-system checked successfully
✔ CustomResourceDefinition: peerauthentications.security.istio.io.istio-system checked successfully
✔ CustomResourceDefinition: requestauthentications.security.istio.io.istio-system checked successfully
✔ CustomResourceDefinition: telemetries.telemetry.istio.io.istio-system checked successfully
✔ CustomResourceDefinition: istiooperators.install.istio.io.istio-system checked successfully
✔ HorizontalPodAutoscaler: istiod.istio-system checked successfully
✔ ClusterRole: istiod-clusterrole-istio-system.istio-system checked successfully
✔ ClusterRole: istiod-gateway-controller-istio-system.istio-system checked successfully
✔ ClusterRoleBinding: istiod-clusterrole-istio-system.istio-system checked successfully
✔ ClusterRoleBinding: istiod-gateway-controller-istio-system.istio-system checked successfully
✔ ConfigMap: istio.istio-system checked successfully
✔ Deployment: istiod.istio-system checked successfully
✔ ConfigMap: istio-sidecar-injector.istio-system checked successfully
✔ MutatingWebhookConfiguration: istio-sidecar-injector.istio-system checked successfully
✔ PodDisruptionBudget: istiod.istio-system checked successfully
✔ ClusterRole: istio-reader-clusterrole-istio-system.istio-system checked successfully
✔ ClusterRoleBinding: istio-reader-clusterrole-istio-system.istio-system checked successfully
✔ Role: istiod.istio-system checked successfully
✔ RoleBinding: istiod.istio-system checked successfully
✔ Service: istiod.istio-system checked successfully
✔ ServiceAccount: istiod.istio-system checked successfully
✔ EnvoyFilter: stats-filter-1.11.istio-system checked successfully
✔ EnvoyFilter: tcp-stats-filter-1.11.istio-system checked successfully
✔ EnvoyFilter: stats-filter-1.12.istio-system checked successfully
✔ EnvoyFilter: tcp-stats-filter-1.12.istio-system checked successfully
✔ EnvoyFilter: stats-filter-1.13.istio-system checked successfully
✔ EnvoyFilter: tcp-stats-filter-1.13.istio-system checked successfully
✔ ValidatingWebhookConfiguration: istio-validator-istio-system.istio-system checked successfully
Checked 15 custom resource definitions
Checked 2 Istio Deployments
✔ Istio is installed and verified successfully

```


Uninstall Istio:
```commandline
$ istioctl x uninstall --purge
All Istio resources will be pruned from the cluster
Proceed? (y/N) y
  Removed IstioOperator:istio-system:installed-state.
  Removed HorizontalPodAutoscaler:istio-system:istio-ingressgateway.
  Removed HorizontalPodAutoscaler:istio-system:istiod.
  Removed PodDisruptionBudget:istio-system:istio-ingressgateway.
  Removed PodDisruptionBudget:istio-system:istiod.
  Removed Deployment:istio-system:istio-ingressgateway.
  Removed Deployment:istio-system:istiod.
  Removed Service:istio-system:istio-ingressgateway.
  Removed Service:istio-system:istiod.
  Removed ConfigMap:istio-system:istio.
  Removed ConfigMap:istio-system:istio-sidecar-injector.
  Removed Pod:istio-system:istio-ingressgateway-755d6cb48f-frxzh.
  Removed Pod:istio-system:istiod-cddd697cf-f82zb.
  Removed ServiceAccount:istio-system:istio-ingressgateway-service-account.
  Removed ServiceAccount:istio-system:istio-reader-service-account.
  Removed ServiceAccount:istio-system:istiod.
  Removed ServiceAccount:istio-system:istiod-service-account.
  Removed RoleBinding:istio-system:istio-ingressgateway-sds.
  Removed RoleBinding:istio-system:istiod.
  Removed RoleBinding:istio-system:istiod-istio-system.
  Removed Role:istio-system:istio-ingressgateway-sds.
  Removed Role:istio-system:istiod.
  Removed Role:istio-system:istiod-istio-system.
  Removed EnvoyFilter:istio-system:stats-filter-1.11.
  Removed EnvoyFilter:istio-system:stats-filter-1.12.
  Removed EnvoyFilter:istio-system:stats-filter-1.13.
  Removed EnvoyFilter:istio-system:tcp-stats-filter-1.11.
  Removed EnvoyFilter:istio-system:tcp-stats-filter-1.12.
  Removed EnvoyFilter:istio-system:tcp-stats-filter-1.13.
  Removed MutatingWebhookConfiguration::istio-revision-tag-default.
  Removed MutatingWebhookConfiguration::istio-sidecar-injector.
  Removed ValidatingWebhookConfiguration::istio-validator-istio-system.
  Removed ValidatingWebhookConfiguration::istiod-default-validator.
  Removed ClusterRole::istio-reader-clusterrole-istio-system.
  Removed ClusterRole::istio-reader-istio-system.
  Removed ClusterRole::istiod-clusterrole-istio-system.
  Removed ClusterRole::istiod-gateway-controller-istio-system.
  Removed ClusterRole::istiod-istio-system.
  Removed ClusterRoleBinding::istio-reader-clusterrole-istio-system.
  Removed ClusterRoleBinding::istio-reader-istio-system.
  Removed ClusterRoleBinding::istiod-clusterrole-istio-system.
  Removed ClusterRoleBinding::istiod-gateway-controller-istio-system.
  Removed ClusterRoleBinding::istiod-istio-system.
  Removed CustomResourceDefinition::authorizationpolicies.security.istio.io.
  Removed CustomResourceDefinition::destinationrules.networking.istio.io.
  Removed CustomResourceDefinition::envoyfilters.networking.istio.io.
  Removed CustomResourceDefinition::gateways.networking.istio.io.
  Removed CustomResourceDefinition::istiooperators.install.istio.io.
  Removed CustomResourceDefinition::peerauthentications.security.istio.io.
  Removed CustomResourceDefinition::proxyconfigs.networking.istio.io.
  Removed CustomResourceDefinition::requestauthentications.security.istio.io.
  Removed CustomResourceDefinition::serviceentries.networking.istio.io.
  Removed CustomResourceDefinition::sidecars.networking.istio.io.
  Removed CustomResourceDefinition::telemetries.telemetry.istio.io.
  Removed CustomResourceDefinition::virtualservices.networking.istio.io.
  Removed CustomResourceDefinition::wasmplugins.extensions.istio.io.
  Removed CustomResourceDefinition::workloadentries.networking.istio.io.
  Removed CustomResourceDefinition::workloadgroups.networking.istio.io.
✔ Uninstall complete   
```

```commandline
$ k delete -f istio-1.13.0/samples/addons/kiali.yaml 
serviceaccount "kiali" deleted
configmap "kiali" deleted
clusterrole.rbac.authorization.k8s.io "kiali-viewer" deleted
clusterrole.rbac.authorization.k8s.io "kiali" deleted
clusterrolebinding.rbac.authorization.k8s.io "kiali" deleted
role.rbac.authorization.k8s.io "kiali-controlplane" deleted
rolebinding.rbac.authorization.k8s.io "kiali-controlplane" deleted
service "kiali" deleted
deployment.apps "kiali" deleted
 
$ k delete -f istio-1.13.0/samples/addons/jaeger.yaml 
deployment.apps "jaeger" deleted
service "tracing" deleted
service "zipkin" deleted
service "jaeger-collector" deleted

$ k delete ns istio-system
namespace "istio-system" deleted
```