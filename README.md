# cheatsheet-kubernetes-A4
Kubernetes CheatSheets In A4

<a href="https://github.com/DennyZhang?tab=followers"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/fork_github.png" /></a>

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

[![LinkedIn](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/linkedin.png)](https://www.linkedin.com/in/dennyzhang001) <a href="https://www.dennyzhang.com/slack" target="_blank" rel="nofollow"><img src="http://slack.dennyzhang.com/badge.svg" alt="slack"/></a> [![Github](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/github.png)](https://github.com/DennyZhang)

File me [tickets](https://github.com/DennyZhang/cheatsheet-kubernetes-A4/issues) or star [the repo](https://github.com/DennyZhang/cheatsheet-kubernetes-A4).

Printable version on A4 page: [cheatsheet-kubernetes-A4.pdf](cheatsheet-kubernetes-A4.pdf)

<a href="https://www.dennyzhang.com"><img align="right" width="185" height="37" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>

See more CheatSheets from Denny: [here](https://github.com/topics/denny-cheatsheets)

- Key Concepts

| Name          | Summary                           |
| :------------| ---------------------             |
| CRI           | Container Runtime Interface       |
| CNI           | Container Network Interface       |
| CSI           | Container Storage Interface       |
| CNCF          | Cloud Native Computing Foundation |

- Kubernets Critical Files

| Name                                                  | Summary               |
| :---------------------------------------------------  | --------------------- |
| /etc/kubernetes/                                      | config folder         |
| /etc/kubernetes/admin.conf                            |                       |
| /etc/kubernetes/kubelet.conf                          |                       |
| /var/lib/kubelet/                                     | kubernets working dir |
| /var/lib/docker                                       | docker working dir    |
| /var/lib/etcd                                         |                       |
| /etc/cni/net.d                                        | network cni           |
| /var/log/containers                                   |                       |
| /var/log/pods                                         | log files             |
| export KUBECONFIG=/etc/kubernetes/admin.conf          | env                   |
| /etc/systemd/system/kubelet.service.d/10-kubeadm.conf | env                   |
| kubelet logs                                          | logs                  |
| kubectl describe node $node_name                      |                       |
| kubectl -n kube-system get cm kubeadm-config -oyaml   | system conf           |
| curl -L http://127.0.0.1:10250/healthz                |                       |

<a href="https://www.dennyzhang.com"><img align="right" width="185" height="37" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>

- Common Commands

| Name                              | Command                                      |
| :------------------------------- | ------------------------------------------   |
| List all services                 | `kubectl get services`                       |
| List all pods                     | `kubectl get pods`                           |
| List all pods with details        | `kubectl get pods -o wide`                   |
| Get pod info                      | `kubectl describe pod srv-mysql-server`      |
| Open a bash terminal in a pod     | `kubectl exec -ti storage -- bash`           |
| Check pod environment variables   | `kubectl exec redis-master-ft9ex env`        |
| Delete pod                        | `kubectl delete pod hello-node-95913-n63qs`  |
| Start a service                   | `kubectl run hello --image=my_img --port=80` |
| Similar to `docker ps`            | `kubectl get nodes`                          |
| Similar to `docker inspect`       | `kubectl describe pod nginx-app-413181-cn`   |
| Similar to `docker logs`          | `kubectl logs`                               |
| Similar to `docker exec`          | `kubectl exec`                               |
| View cluster events               | `kubectl get events`                         |
| Get deployment info               | `kubectl get deploy`                         |
| Get replication controller        | `kubectl get rc`                             |

- Volume

| Name                        | Command                         |
| :------------------------- | -----------------------------   |
| Check the mounted volumes   | `kubectl exec storage ls /data` |

- System

| Name                | Command                |
| :----------------- | ---------------------  |
| Get kubectl version | `kubectl version`      |
| Get cluster info    | `kubectl cluster-info` |
| Get configuration   | `kubectl config view`  |

- Scale

| Summary     | Command                                           |
| :--------- | :-----------------------------------------------  |
| Scale out   | `kubectl scale --replicas=3 deployment/nginx-app` |

- Volume

| Summary              | Command                      |
| :------------------ | :--------------------------- |
| Check persist volume | `kubectl describe pv pv0001` |

- Deletion

| Summary                       | Command                                |
| :--------------------------  | :------------------------------------- |
| Delete service                | `kubectl delete service nginxservice`  |
| Delete replication controller | `kubectl delete rc nginx`              |

- Upgrade  

| Name                     | Command                                               |
| :---------------------- | :---------------------------------------------------- |
| online rolling upgrade   | `kubectl rolling-update app-v1 app-v2 --image=img:v2` |
| Roll backup              | `kubectl rolling-update app-v1 app-v2 --rollback`     |
| Check update status      | `kubectl rollout status deployment/nginx-app`         |
| Check update history     | `kubectl rollout history deployment/nginx-app`        |

TODO: rolling-update command is imperative, better use Deployments rollout. It's declarative.

```
$ kubectl --help
kubectl controls the Kubernetes cluster manager.

Find more information at https://github.com/GoogleCloudPlatform/kubernetes.

Usage:
  kubectl [flags]
  kubectl [command]

Available Commands:
  get            Display one or many resources
  describe       Show details of a specific resource
  create         Create a resource by filename or stdin
  update         Update a resource by filename or stdin.
  delete         Delete a resource by filename, stdin, resource and ID, or by resources and label selector.
  namespace      SUPERCEDED: Set and view the current Kubernetes namespace
  logs           Print the logs for a container in a pod.
  rolling-update Perform a rolling update of the given ReplicationController.
  scale          Set a new size for a Replication Controller.
  exec           Execute a command in a container.
  port-forward   Forward one or more local ports to a pod.
  proxy          Run a proxy to the Kubernetes API server
  run            Run a particular image on the cluster.
  stop           Gracefully shut down a resource by id or filename.
  expose         Take a replicated application and expose it as Kubernetes Service
  label          Update the labels on a resource
  config         config modifies kubeconfig files
  cluster-info   Display cluster info
  api-versions   Print available API versions.
  version        Print the client and server version information.
  help           Help about any command

...
...
...
```

# Related Resources
- https://github.com/kubecamp/kubernetes_in_2_days

<a href="https://www.dennyzhang.com"><img align="right" width="201" height="268" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/denny_201706.png"></a>

<a href="https://www.dennyzhang.com"><img align="right" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>

# License
- Code is licensed under [MIT License](https://www.dennyzhang.com/wp-content/mit_license.txt).
