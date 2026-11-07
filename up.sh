#!/bin/bash
echo "######## Deploy Kind K8S cluster #######"


kind create cluster --config kind/kind-config.yaml --image kindest/node:v1.36.4


echo "###### Install cert-manager using Helm #####"


helm dependency update  ./helm/cert-manager
helm upgrade cert-manager -n cert-manager --install ./helm/cert-manager --create-namespace -f ./helm/cert-manager/values.yaml --kube-context kind-demo

sleep 20

echo "###### Install kube-green using Helm #####"

helm dependency update  ./helm/kube-green
helm upgrade kube-green -n kube-system --install ./helm/kube-green -f ./helm/kube-green/values.yaml --kube-context kind-demo

sleep 20


echo "###### Install demo-app using Helm #####"


helm upgrade demo-app -n demo-app --install ./helm/demo-app --create-namespace -f ./helm/demo-app/values.yaml --kube-context kind-demo

sleep 20









