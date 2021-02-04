#!/bin/sh
docker container prune
docker image prune
docker rmi mysql_image
docker rmi nginx_image
docker rmi ftps_image
docker rmi grafana_image
docker rmi wordpress_image
docker rmi phpmyadmin_image
docker rmi influxdb_image

kubectl delete --all ingresses
kubectl delete --all deployments
kubectl delete --all pods
kubectl delete --all services
kubectl delete --all pvc

minikube stop
minikube delete
