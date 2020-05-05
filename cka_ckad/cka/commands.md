
---

- Shortcuts

```bash
printf "\nalias k='kubectl'\n\
alias kgn='k get no'\n\
alias kgp='k get po'\n\
alias kgns='k get ns'\n\
alias kgcs='k get cs'\n\
alias kar='k api-resources'\n\
alias kcgc='k config get-contexts'\n\
alias kcuc='k config use-context'\n\
"\
>> ~/.bashrc
```
---

```bash
$ kubectl get pods --show-labels
```

---

```bash
$ kubectl run --generator=run-pod/v1 nginx --image=nginx --dry-run=true -o yaml > nginx_pod.yaml
```

---
































---
- Blogs:
  - https://ahmet.im/blog/kubectl-aliases/