#!/bin/bash
echo "###### Uninstall demo-app using Helm #####"


helm uninstall demo-app -n demo-app --kube-context kind-demo

sleep 20


echo "###### Uninstall kube-green using Helm #####"

helm uninstall kube-green -n kube-system --kube-context kind-demo

sleep 20


echo "###### Uninstall cert-manager using Helm #####"


helm uninstall cert-manager -n cert-manager --kube-context kind-demo

sleep 20

echo "######## Delete Kind K8S cluster #######"

kind delete clusters demo





