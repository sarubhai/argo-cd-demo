#!/bin/bash

kubectl patch app backend-api --namespace argo-cd  -p '{"metadata": {"finalizers": ["resources-finalizer.argocd.argoproj.io"]}}' --type merge
kubectl delete app backend-api --namespace argo-cd

helm uninstall argo-cd --namespace argo-cd
kubectl delete secret argocd-server-tls --namespace argo-cd
kubectl delete -f namespace.yaml
