#!/bin/bash

echo "=========================================="
echo " CloudCart - Product Service Final Check"
echo "=========================================="

echo
echo ">>> 1. Minikube Status"
echo "------------------------------------------"
minikube status

echo
echo ">>> 2. Kubernetes Nodes"
echo "------------------------------------------"
kubectl get nodes

echo
echo ">>> 3. CloudCart Pods"
echo "------------------------------------------"
kubectl get pods -n cloudcart

echo
echo ">>> 4. CloudCart Services"
echo "------------------------------------------"
kubectl get svc -n cloudcart

echo
echo ">>> 5. CloudCart Ingress"
echo "------------------------------------------"
kubectl get ingress -n cloudcart

echo
echo ">>> 6. Deployments + Images"
echo "------------------------------------------"
kubectl get deployment -n cloudcart \
  -o custom-columns='NAME:.metadata.name,READY:.status.readyReplicas,AVAILABLE:.status.availableReplicas,IMAGE:.spec.template.spec.containers[0].image'

echo
echo ">>> 7. ArgoCD Application"
echo "------------------------------------------"
kubectl get application cloudcart -n argocd \
  -o jsonpath='{.status.sync.status}{" "}{.status.health.status}{"\n"}'

echo
echo ">>> 8. ArgoCD Resource Status"
echo "------------------------------------------"
kubectl get application cloudcart -n argocd \
  -o jsonpath='{range .status.resources[*]}{.kind}{" "}{.name}{" "}{.status}{"\n"}{end}'

echo
echo ">>> 9. Product Service Pod"
echo "------------------------------------------"
kubectl get pods -n cloudcart -l app=product-service -o wide

echo
echo ">>> 10. Product Service Deployment"
echo "------------------------------------------"
kubectl get deployment product-service -n cloudcart -o wide

echo
echo ">>> 11. Product Service Image"
echo "------------------------------------------"
kubectl get deployment product-service -n cloudcart \
  -o jsonpath='{.spec.template.spec.containers[0].image}{"\n"}'

echo
echo ">>> 12. Product Service Logs"
echo "------------------------------------------"
kubectl logs -n cloudcart \
  -l app=product-service \
  --tail=50

echo
echo ">>> 13. Ingress HTTP Test"
echo "------------------------------------------"
curl -I --max-time 10 http://cloudcart.local

echo
echo ">>> 14. Frontend HTTP Test"
echo "------------------------------------------"
curl -s --max-time 10 http://cloudcart.local | head -20

echo
echo "=========================================="
echo " Diagnostic Check Complete"
echo "=========================================="
