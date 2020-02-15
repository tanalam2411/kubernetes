`......................................................... GoTo` [***`Introduction`***](README.md)

**Introduction** (Controllers and Operators)


- **Controller** - Controllers are control loops that watch the state of your cluster, then make or request for changes where needed. Each controller tries to move the current cluster state closer to the desired state.
  - Controllers watch the shared state of your cluster through the apiserver.
  - Controllers can watch and manipulate user defined [`custom resources`](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/).
- **Kube-controller-manager** - Some controllers run inside the control plane, providing control loops that are core to kubernetes'  operations. For example: the deployment controller, the daemonset controller, the namespace controller, and the persistent volume controller etc, all run within the [`kube-controller-manager`](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/).
  - Logically, each controller is a separate process, but to reduce complexity, they are all compiled into a single binary and run in a single process.
  
- **Operators** - Are controllers that encode some operational knowledge, such as application lifecycle management, along with the custom resources.
  - An [**Operator**](https://coreos.com/operators/) is a method of packaging, deploying and managing a kubernetes application.
    - A kubernetes application is an application that is both deployed on kubernetes and managed using kubernetes APIs and kubectl tooling.
    - You can think of Operators as the runtime that manages this type of application on kubernetes.

