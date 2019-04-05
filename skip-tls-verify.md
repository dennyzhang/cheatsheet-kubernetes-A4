```
apiVersion: v1
clusters:
- cluster:
    server: https://192.168.0.100:8443
    insecure-skip-tls-verify: true
  name: minikube
contexts:
- context:
    cluster: minikube
    user: minikube
  name: minikube
current-context: minikube
kind: Config
preferences: {}
users:
- name: minikube
  user:
    client-certificate: C:\Users\wes.robinson\.minikube\client.crt
    client-key: C:\Users\wes.robinson\.minikube\client.key
```

https://github.com/terraform-providers/terraform-provider-kubernetes/issues/189