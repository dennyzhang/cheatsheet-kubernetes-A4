# cheatsheet-kubernetes-A4
Kubernetes CheatSheets In A4

<a href="https://github.com/DennyZhang?tab=followers"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/fork_github.png" /></a>

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com) [![LinkedIn](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/linkedin.png)](https://www.linkedin.com/in/dennyzhang001) [![Slack](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/slack.png)](https://www.dennyzhang.com/slack) [![Github](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/github.png)](https://github.com/DennyZhang)

File me [tickets](https://github.com/DennyZhang/cheatsheet-kubernetes-A4/issues) or star [the repo](https://github.com/DennyZhang/cheatsheet-kubernetes-A4).

Printable version on A4 page: [cheatsheet-kubernetes-A4.pdf](cheatsheet-kubernetes-A4.pdf)

<a href="https://www.dennyzhang.com"><img align="right" width="185" height="37" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/dns_small.png"></a>

- Commands

| Name                                        | Summary               |
| :------------------------------------------ | --------------------- |
| `kubectl get pods`                          |                       |
| `kubectl delete pod hello-node-95913-n63qs` |                       |
| `kubectl get nodes`                         | like `docker ps`      |
| `kubectl cluster-info`                      |                       |
| `kubectl config view`                       | Get configuration     |
| `kubectl describe pod nginx-app-413181-cn`  | like `docker inspect` |
| `kubectl logs`                              | like `docker logs`    |
| `kubectl exec`                              | like `docker exec`    |
| `kubectl get events`                        | View cluster events   |
| `kubectl get deploy`                        |                       |

- Scale

| Name                                              | Summary   |
| :-----------------------------------------------  | --------- |
| `kubectl scale --replicas=3 deployment/nginx-app` |           |

- Upgrade  

| Name                                                  | Summary                |
| :---------------------------------------------------- | ---------------------- |
| `kubectl rolling-update app-v1 app-v2 --image=img:v2` | online rolling upgrade |
| `kubectl rolling-update app-v1 app-v2 --rollback`     |                        |
| `kubectl rollout status deployment/nginx-app`         |                        |
| `kubectl rollout history deployment/nginx-app`        |                        |

<a href="https://www.dennyzhang.com"><img align="right" width="201" height="268" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/denny_201706.png"></a>

# License
- Code is licensed under [MIT License](https://www.dennyzhang.com/wp-content/mit_license.txt).
