`......................................................... GoTo` [***`Introduction`***](README.md)


**Optimistic Concurrency**

- Concurrent writes can fail because of write conflicts.

- To handle this the API server detects concurrent write attempts, it rejects of the later of the two operations. 

example:
```go
var err error

for retries := 0; retries < 10; retries++ {
    foo, err := client.Get("foo", metav1.GetOptions{})
    if err != nil {
        break
    }
    
    // update foo
    
    _, err = client.Update(foo)
    if err != nil && errors.IsConflict(err) {
        continue
    } else if err != nil {
        break
    }   
}
```

- Returned object `foo` from `client.Get` call contains a resource [`version`](https://godoc.org/k8s.io/apimachinery/pkg/apis/meta/v1#ObjectMeta)([`github ref`](https://github.com/kubernetes/apimachinery/blob/62598f38f24eabad89ddd52347282202797a6de9/pkg/apis/meta/v1/types.go)).
- Resource Versions is a `key/value` (value -> string(int counter) version, which maintains a counter that increases each time the value of key is modified.
- So when concurrent writes are attempted the first one being picked gets updated and as the rest doesn't have the latest `resourceVersion` the API Servers rejects that update request and raises `conflict error`.

- Controller are responsible for implementing the retry strategy in case of conflict error.



