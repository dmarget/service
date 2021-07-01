minikube start --vm-driver=virtualbox --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=10G
minikube ssh 'sudo mkdir /mnt/influxdb; sudo chmod 777 /mnt/influxdb'
minikube addons enable metallb

eval $(minikube docker-env)

docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2

echo "Kubectl apply metallb"
kubectl apply -f srcs/yaml/metallb.yaml

echo "Docker build Nginx"
docker build -t nginx_image ./srcs/nginx
echo "Kubectl apply nginx"
kubectl apply -f ./srcs/yaml/nginx.yaml

echo "Docker build mysql"
docker build -t mysql_image ./srcs/mysql
echo "Kubectl apply mysql"
kubectl apply -f ./srcs/yaml/mysql.yaml

echo "Docker build Wordpress"
docker build -t wp_image ./srcs/wordpress
echo "Kubectl apply wp"
kubectl apply -f ./srcs/yaml/wordpress.yaml

echo "Docker build phpmyadmin"
docker build -t php_image ./srcs/phpmyadmin
echo "Kubectl apply wp"
kubectl apply -f ./srcs/yaml/phpMA.yaml

echo "Docker build ftps"
docker build -t ftps_image ./srcs/ftps
echo "Kubectl apply ftps"
kubectl apply -f ./srcs/yaml/ftps.yaml

echo "Docker build influx"
docker build -t influxdb_image ./srcs/influxdb
echo "Kubectl apply influx"
kubectl apply -f ./srcs/yaml/influxdb.yaml

echo "Docker build grafana"
docker build -t grafana_image ./srcs/grafana
echo "Kubectl apply grafana"
kubectl apply -f ./srcs/yaml/grafana.yaml

# echo "Kubectl apply metallb"
# kubectl apply -f yaml/metallb.yaml
# echo "Kubectl apply nginx"
# kubectl apply -f yaml/nginx.yaml
# echo "Kubectl apply wp"
# kubectl apply -f yaml/wordpress.yaml
# echo "Kubectl apply wp"
# kubectl apply -f yaml/phpMA.yaml
# echo "Kubectl apply mysql"
# kubectl apply -f yaml/mysql.yaml
# echo "Kubectl apply ftps"
# kubectl apply -f yaml/ftps.yaml
# echo "Kubectl apply influx"
# kubectl apply -f yaml/influxdb.yaml
# echo "Kubectl apply grafana"
# kubectl apply -f yaml/grafana.yaml
# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

minikube dashboard
