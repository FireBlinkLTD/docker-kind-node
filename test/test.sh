#!/bin/bash
set -e

bash ./k8s-init.sh

# verify that cluster can respond to API calls
kind get kubeconfig > ~/.kube/config
kubectl get configmap --all-namespaces

bash ./k8s-destroy.sh