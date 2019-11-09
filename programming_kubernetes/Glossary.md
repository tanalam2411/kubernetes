

1) [**Imperative Systems**](https://medium.com/@dominik.tornow/imperative-vs-declarative-8abc7dcae82e) - In an imperative system, the user knows the desired state, determines the sequence of commands to transition the system to the desired state, and supplies a representation of the commands to the system. The component of the system that applies the command to transition the state is called a processor.

2) [**Declarative Systems**](https://medium.com/@dominik.tornow/imperative-vs-declarative-8abc7dcae82e) - In a declarative system, the user knows the desired state, supplies a representation of the desired state of the system, then the system reads the current state and determines the sequence of commands to transition the system to the desired state. The component that determines the necessary sequence of commands is called a `controller`.

3) [**Control loop**](https://medium.com/@dominik.tornow/imperative-vs-declarative-8abc7dcae82e) - Declarative systems have the distinct advantage of being able to react to unintended state changes without further supervision: In the event of an unintended state change leading to a state drift, the system may autonomously determine and apply the set of mitigating actions leading to state match. This process is called `control loop`.   

```
In an imperative system, the user is responsible for knowing how to drive the system to the desired state, 
whereas in a declarative system, the system is responsible for knowing how to drive itself to the desired state.
```

4) **Optimistic Concurrency** - Controller's don't talk to each other directly, there's a potential for race conditions when state is to be changed, e.g. a write to same object from different controllers. It needs to be handled in he application layer(i.e. in each controller logic).
5) **[Finalizer](https://kubernetes.io/docs/tasks/access-kubernetes-api/custom-resources/custom-resource-definitions/#finalizers)** - Finalizers allow controllers to implement asynchronous pre-delete hooks. Custom objects support finalizers just like built-in objects.
