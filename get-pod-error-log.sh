#!/usr/bin/env bash
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
