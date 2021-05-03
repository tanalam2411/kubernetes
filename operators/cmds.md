```bash
operator-sdk init --domain=example.com --repo=github.com/tan/x-operator
make generate - to update the code with respect to change in resource type
make manifest - to generate CRD manifests, RBAC manifests(based on markers)
make install - to deploy operator(uses kustomize)
make docker-build IMG=quay.io/#USERNAME/operators-name:v0.0.1
make docker-push IMG=quay.io/$USERNAME/operators-name:v0.0.1
make deploy IMG=quay.io/$USERNAME/operators-name:v0.0.1
```