chmod +x ./init1.sh
chmod +x ./init2.sh
chmod +x ./init3.sh

./init1.sh

sleep 20

kubectl get deployment -n kube-system aws-load-balancer-controller

./init2.sh

sleep 20

./init3.sh

sleep 20


echo 'done'

echo http://$(kubectl get ingress/frontend-ingress -o jsonpath='{.status.loadBalancer.ingress[*].hostname}')
