# About

Docker image with preinstalled [KinD](https://kind.sigs.k8s.io/) that is based on node:alpine image.

Additionally contains:
- kubectl
- kubeadm
- helm (v3)
- helm_v2 (v2)

# Purpose

The main purpose of this image is the ability to use it inside CI worflows for tools that require or specifically designed for Kubernetes.

