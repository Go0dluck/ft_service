docker build -t nginx_image .
kubectl delete svc nginx-svc
kubectl delete deploy nginx-deployment
kubectl apply -f nginx.yaml
sleep 3
kubectl get deploy
kubectl get svc