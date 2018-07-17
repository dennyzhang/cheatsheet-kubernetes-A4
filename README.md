# cheatsheet-kubernetes-A4
Kubernetes CheatSheets In A4

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

[![LinkedIn](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/linkedin_icon.png)](https://www.linkedin.com/in/dennyzhang001) <a href="https://www.dennyzhang.com/slack" target="_blank" rel="nofollow"><img src="http://slack.dennyzhang.com/badge.svg" alt="slack"/></a> [![Github](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/github.png)](https://github.com/DennyZhang)

Printable version on A4 page: [cheatsheet-kubernetes-A4.pdf](cheatsheet-kubernetes-A4.pdf). See more CheatSheets [here](https://github.com/topics/denny-cheatsheets)

<a href="https://github.com/DennyZhang?tab=followers"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/fork_github.png" /></a>

Table of Contents
=================

   * [Key Concepts](#key-concepts)
   * [Kubernets Critical Files](#kubernets-critical-files)
   * [Check status](#check-status)
   * [Pod](#pod)
   * [Common Commands](#common-commands)
   * [Namespace &amp; Security](#namespace--security)
   * [Volume](#volume)
   * [Scale &amp; Deployment](#scale--deployment)
   * [Minikube](#minikube)
   * [Related Resources](#related-resources)
   * [License](#license)

<a href="https://www.dennyzhang.com"><img align="right" width="185" height="37" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>

# Key Concepts

| Name   | Summary                           |
| :----- | ---------------------             |
| CRI    | Container Runtime Interface       |
| CNI    | Container Network Interface       |
| CSI    | Container Storage Interface       |
| CNCF   | Cloud Native Computing Foundation |

# Kubernets Critical Files

| Name                                                  | Summary                   |
| :---------------------------------------------------  | ------------------------- |
| /etc/kubernetes/                                      | config folder             |
| /etc/kubernetes/pki/                                  | certificate files         |
| /etc/kubernetes/kubelet.conf                          | credentials to API server |
| /etc/kubernetes/admin.conf                            | superuser credentials     |
| /var/lib/kubelet/                                     | kubernets working dir     |
| /var/lib/docker                                       | docker working dir        |
| /var/lib/etcd                                         |                           |
| /etc/cni/net.d                                        | network cni               |
| /var/log/containers                                   |                           |
| /var/log/pods                                         | log files                 |
| export KUBECONFIG=/etc/kubernetes/admin.conf          | env                       |
| /etc/systemd/system/kubelet.service.d/10-kubeadm.conf | env                       |
| kubelet logs                                          | logs                      |

<a href="https://www.dennyzhang.com"><img align="right" width="185" height="37" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>

# Check status

| Name                                 | Command                                               |
| :----------------------------------- | ----------------------------------------------------- |
| Get kubectl version                  | `kubectl version`                                     |
| Get cluster info                     | `kubectl cluster-info`                                |
| Get configuration                    | `kubectl config view`                                 |
| Get component status                 | `kubectl get componentstatus`                         |
| Get node status                      | `kubectl describe node $node_name`                    |
| Get services for current namespace   | `kubectl get svc`                                     |
| Get all services for all namespace   | `kubectl get service --all-namespaces`                |
| Get system conf                      | `kubectl -n kube-system get cm kubeadm-config -oyaml` |
| Query healthcheck endpoint           | `curl -L http://127.0.0.1:10250/healthz`              |

# Pod

| Name                         | Command                                                                                                                                   |
| :----------------------      | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Get pod by selector          | `pod_name=$(kubectl get pods -n $namespace --selector="app=syslog" -o jsonpath='{.items[*].metadata.name}')`                              |
| List pods with docker images | `kubectl get pods -o=jsonpath='{range .items[*]}{.metadata.name}:{.spec.containers[0].name}{"\t"}{.spec.containers[0].image}{"\n"}{end}'` |
| kubectl run command          | `kubectl exec -it -n "$namespace" "$pod_name"  -- sh -c "echo $test_msg  >>/dev/termination-log"`                                         |
| List all pods with labels    | `kubectl get pods --show-labels`                                                                                                          |
| List all pods                | `kubectl get pods`                                                                                                                        |
| List all pods                | `kubectl get pods –all-namespaces`                                                                                                        |
| List pods with more info     | `kubectl get pod -o wide`                                                                                                                 |
| List all services            | `kubectl get services`                                                                                                                    |
| List all critical pods       | `kubectl get -n kube-system pods -a`                                                                                                      |
| Get pod info                 | `kubectl describe pod srv-mysql-server`                                                                                                   |
| Add label to pod             | `kubectl label pods labelex owner=denny`                                                                                                  |
| Filter pod by label          | `kubectl get pods --selector owner=michael`                                                                                               |

# Common Commands

| Name                             | Command                                       |
| :------------------------------- | --------------------------------------------- |
| Open a bash terminal in a pod    | `kubectl exec -it storage -- bash`            |
| Check pod environment variables  | `kubectl exec redis-master-ft9ex env`         |
| Delete pod                       | `kubectl delete pod hello-node-95913-n63qs`   |
| Start a service                  | `kubectl run hello --image=my_img --port=80`  |
| Similar to `docker ps`           | `kubectl get nodes`                           |
| Similar to `docker inspect`      | `kubectl describe pod nginx-app-413181-cn`    |
| Similar to `docker logs`         | `kubectl logs`                                |
| Similar to `docker exec`         | `kubectl exec`                                |
| View cluster events              | `kubectl get events`                          |
| Get deployment info              | `kubectl get deploy`                          |
| Get replication controller       | `kubectl get rc`                              |
| Delete service                   | `kubectl delete service nginxservice`         |
| Delete replication controller    | `kubectl delete rc nginx`                     |

# Namespace & Security

| Name                             | Command                                    |
| :------------------------------- | ------------------------------------------ |
| list authenticated contexts      | `kubectl config get-contexts`              |
| set the context to interact with | `kubectl config use-context $context_name` |
| list all namespaces defined      | `kubectl get namespaces`                   |

# Volume

| Name                       | Command                         |
| :------------------------- | ------------------------------- |
| Check the mounted volumes  | `kubectl exec storage ls /data` |
| Check persist volume       | `kubectl describe pv pv0001`    |

# Scale & Deployment

[link](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#pausing-and-resuming-a-deployment)

| Name                   | Command                                                       |
| :--------------------- | :-----------------------------------------------              |
| Scale out              | `kubectl scale --replicas=3 deployment/nginx-app`             |
| online rolling upgrade | `kubectl rolling-update app-v1 app-v2 --image=img:v2`         |
| Roll backup            | `kubectl rolling-update app-v1 app-v2 --rollback`             |
| List rollout           | `kubectl get rs`                                              |
| Check update status    | `kubectl rollout status deployment/nginx-app`                 |
| Check update history   | `kubectl rollout history deployment/nginx-app`                |
| Pause/Resume           | `kubectl rollout pause deployment/nginx-deployment`, `resume` |

# Minikube

minikube in GitHub: [link](https://github.com/kubernetes/minikube)

| Name                   | Command                      |
| :--------------------- | --------------------------   |
| Start minikube env     | `minikube start`             |
| Get dashboard          | `minikube dashboard`         |
| ssh to minikube vm     | `minikube ssh`               |
| Get ip                 | `minikube ip`                |
| Get cluster info       | `kubectl cluster-info`       |
| List addons            | `minikube addons list`       |
| Get service info       | `minikube service $srv_name` |

<a href="https://www.dennyzhang.com"><img align="right" width="185" height="37" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>

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
- https://kubernetes.io/docs/reference/kubectl/cheatsheet/
- https://github.com/kubecamp/kubernetes_in_2_days
- https://marc.xn--wckerlin-0za.ch/computer/kubernetes-on-ubuntu-16-04
- https://codefresh.io/kubernetes-guides/kubernetes-cheat-sheet/

<a href="https://www.dennyzhang.com"><img align="right" width="201" height="268" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/denny_201706.png"></a>

<a href="https://www.dennyzhang.com"><img align="right" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>

# License
- Code is licensed under [MIT License](https://www.dennyzhang.com/wp-content/mit_license.txt).
