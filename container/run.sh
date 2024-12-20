#!/bin/bash
export KUBECONFIG=$HOME/.kube/config
kubectl apply -f ../k8s/deployment.yaml
kubectl apply -f ../k8s/service.yaml
# Restart deployment to use the latest image
kubectl rollout restart deployment/nginx-rtmp-deployment