`......................................................... GoTo` [***`Introduction`***](README.md)


**[Operators](https://coreos.com/blog/introducing-operators.html)**

- An Operator is an application-specific controller that extends the kubernetes API to create, configure, and manage instances of complex stateful applications on behalf of a kubernetes user.
- An operator represents human operational knowledge in software, to reliably manage an application.

![Cassandra-Kubernetes-Operator-LP_How-Does-it-Works.png](https://24b4dt1v60e526bo2p349l4c-wpengine.netdna-ssl.com/wp-content/uploads/2019/02/Cassandra-Kubernetes-Operator-LP_How-Does-it-Works.png)

- Artifacts shipped in the context of the operator are:
  - A set of custom resource definitions(CRDs) capturing the domain-specific schema and custom resources following the CRDs that, on the instance level, represent the domain of interest.
    ![](https://www.oreilly.com/library/view/programming-kubernetes/9781492047094/assets/prku_0105.png)
  - A custom controller, supervising the custom resoruces, potentially along with core resources.
    For example, the custom controller might spin up a pod.`