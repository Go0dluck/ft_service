#!/bin/sh
minikube start --driver=none
minikube addons enable metallb

echo -e "\033[0m\n\033[0m\033[31m MAKE NGINX"
docker build -t nginx_image ./srcs/nginx
echo -e "\033[0m\n\033[0m\033[32m MAKE INFLUXDB"
docker build -t influxdb_image ./srcs/influxdb
echo -e "\033[0m\n\033[0m\033[33m MAKE GRAFANA"
docker build -t grafana_image ./srcs/grafana
echo -e "\033[0m\n\033[0m\033[34m MAKE FTPS"
docker build -t ftps_image ./srcs/ftps
echo -e "\033[0m\n\033[0m\033[35m MAKE MYSQL"
docker build -t mysql_image ./srcs/mysql
echo -e "\033[0m\n\033[0m\033[36m MAKE PHPMYADMIN"
docker build -t phpmyadmin_image ./srcs/phpmyadmin
echo -e "\033[0m\n\033[0m\033[31m MAKE WORDPRESS"
docker build -t wordpress_image ./srcs/wordpress

kubectl apply -f ./srcs/configmap.yaml
kubectl apply -f ./srcs/influxdb.yaml
kubectl apply -f ./srcs/nginx.yaml
kubectl apply -f ./srcs/ftps.yaml
kubectl apply -f ./srcs/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress.yaml
kubectl apply -f ./srcs/grafana.yaml

echo -e "\033[0m\n\033[0m\033[32m waiting 30 sec...."
sleep 30
minikube dashboard
