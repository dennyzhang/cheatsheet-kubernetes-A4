https://kubernetes.io/docs/tasks/run-application/run-replicated-stateful-application/

Accessing the MySQL instance

```
kubectl run -it --rm --image=mysql:5.6 --restart=Never mysql-client -- mysql -h mysql -ppassword
```
