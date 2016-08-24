#!/bin/bash

IMAGE_NAME="gris"

start_services(){
	docker exec -d $IMAGE_NAME service apache2 start
	docker exec -d $IMAGE_NAME service mysql start
	docker exec -d $IMAGE_NAME service slapd start
	docker exec -d $IMAGE_NAME chown -R www-data:www-data /var/www/gris
}

case "$1" in
	build)
		source config.sh

		docker build -t $IMAGE_NAME \
		--build-arg MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
		--build-arg LDAP_ROOT_PASSWORD=$LDAP_ROOT_PASSWORD \
		--build-arg PMA_USER_PASSWORD=$PMA_USER_PASSWORD \
		--build-arg GRIS_DB_USER_PASSWORD=$GRIS_DB_USER_PASSWORD \
		--build-arg LDAP_DOMAIN=$LDAP_DOMAIN \
		.
		;;
	start)
		docker run -dt --name=$IMAGE_NAME -p 8081:80 $IMAGE_NAME
		start_services
		;;
	linux)
		docker run -dt --name=$IMAGE_NAME -v $PWD/app:/var/www -p 8081:80 $IMAGE_NAME
                start_services
		;;
	stop)	
		docker commit -p gris gris
		docker stop $IMAGE_NAME
		docker rm $IMAGE_NAME
		;;
	remove)
		docker rm $IMAGE_NAME
		;;
	save)
		docker stop $IMAGE_NAME
		docker commit gris $IMAGE_NAME
		docker start $IMAGE_NAME
		start_services
		;;
	bash)
		docker exec -ti $IMAGE_NAME bash
		;;
	fix)
		docker rm --force `docker ps -qa`
		;;
	update)
		docker exec -d $IMAGE_NAME git --git-dir=/var/www/gris/.git --work-tree=/var/www/gris pull origin master
esac
