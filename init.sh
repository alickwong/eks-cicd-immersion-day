chmod +x ./init1.sh
chmod +x ./init2.sh
chmod +x ./init3.sh

export EKS_CLUSTER_NAME=eks-workshop
export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account);
export AWS_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region');
export AZS=($(aws ec2 describe-availability-zones --query 'AvailabilityZones[].ZoneName' --output text --region $AWS_REGION));

./init1.sh

sleep 20

kubectl get deployment -n kube-system aws-load-balancer-controller

./init2.sh

sleep 20

./init3.sh

sleep 20


echo 'done'

echo http://$(kubectl get ingress/frontend-ingress -o jsonpath='{.status.loadBalancer.ingress[*].hostname}')
