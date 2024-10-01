#!/bin/bash

kubectl apply -f namespace.yaml
kubectl create secret tls argocd-server-tls --namespace argo-cd --cert=selfsigned.crt --key=selfsigned.key

# Argo CD
helm upgrade --install argo-cd argo-cd \
    --repo https://argoproj.github.io/argo-helm \
    --namespace argo-cd \
    --set global.domain=argo-cd.local \
    --set configs.params."server\.insecure"=true \
    --set server.ingress.enabled=true \
    --set server.ingress.ingressClassName=nginx \
    --set server.ingress.annotations."nginx\.ingress\.kubernetes\.io/force-ssl-redirect"="true" \
    --set server.ingress.annotations."nginx\.ingress\.kubernetes\.io/backend-protocol"="HTTP" \
    --set server.ingress.tls=true


while ! kubectl get secret argocd-initial-admin-secret --namespace argo-cd; do echo "."; sleep 1; done


echo "Access Argo CD API Server:"
echo "URL: https://argo-cd.local"
echo "Username: admin"
# Argo CD `admin` Password
PASSWORD=`kubectl get secret argocd-initial-admin-secret --namespace argo-cd -o jsonpath="{.data.password}" | base64 -d`
echo "Password: $PASSWORD"


# Argo CD Managed Demo Application
until curl -k --output /dev/null --silent --head --fail https://argo-cd.local; do
    printf '.'
    sleep 5
done
kubectl apply -f demo-application.yaml
echo "Access Argo CD Managed Demo Application:"
echo "URL: https://python-api.local/api/products"
