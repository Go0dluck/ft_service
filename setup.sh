#!/bin/sh
minikube start --driver=none
minikube addons enable metallb

docker build -t nginx_image ./srcs/nginx
docker build -t influxdb_image ./srcs/influxdb
docker build -t grafana_image ./srcs/grafana
docker build -t ftps_image ./srcs/ftps
docker build -t mysql_image ./srcs/mysql
docker build -t phpmyadmin_image ./srcs/phpmyadmin
docker build -t wordpress_image ./srcs/wordpress

kubectl apply -f ./srcs/configmap.yaml
kubectl apply -f ./srcs/influxdb.yaml
kubectl apply -f ./srcs/nginx.yaml
kubectl apply -f ./srcs/ftps.yaml
kubectl apply -f ./srcs/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress.yaml
kubectl apply -f ./srcs/grafana.yaml

echo "waiting 30 sec...."
sleep 30
minikube dashboard
