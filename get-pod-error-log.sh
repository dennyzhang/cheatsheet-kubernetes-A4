#!/usr/bin/env bash
##  @copyright 2019 DennyZhang.com
## Licensed under MIT 
##   https://www.dennyzhang.com/wp-content/mit_license.txt
##
## File: delete_all_containers.sh
## Author : Denny <https://www.dennyzhang.com/contact>
## Description : https://cheatsheet.dennyzhang.com/cheatsheet-kubernetes-A4
## --
## Created : <2018-07-10>
## Updated: Time-stamp: <2019-07-31 22:54:01>
##-------------------------------------------------------------------
# curl -L https://raw.githubusercontent.com/dennyzhang/cheatsheet-kubernetes-A4/master/get-pod-error-log.sh | bash
namespace=${1:-""}
log_pattern="grep -iE 'exception|error' | grep -v 'Reconciler error' | tail -n10"

if [ -z "$namespace" ]; then
    options="--all-namespaces"
else
    options="-n $namespace"
fi
command="kubectl get pods -o='custom-columns=PODS:.metadata.name,PODS:.metadata.namespace' $options | grep -v PODS"
echo "$command"
pods=$(eval "$command")

IFS=$'\n'
for item in $pods; do
    pod=$(echo "$item" | awk '{print $1}')
    ns=$(echo "$item" | awk '{print $2}')
    command="kubectl logs pod/$pod -n $ns | $log_pattern"
    echo "$command" && eval "$command"
done
