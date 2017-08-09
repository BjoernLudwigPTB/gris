#!/bin/bash

IMAGE_NAME="gris"

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
		;;
	stop)	
		docker commit -p gris gris
		docker stop $IMAGE_NAME
		;;
	remove)
		docker rm $IMAGE_NAME
		;;
	commit)
		docker commit -p gris $IMAGE_NAME
		;;
	update)
		docker exec -d $IMAGE_NAME git --git-dir=/var/www/gris/.git --work-tree=/var/www/gris pull origin master
esac
