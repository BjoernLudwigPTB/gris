FROM debian:8.9

LABEL maintainer="Bjoern Ludwig <bjoern.ludwig@ptb.de>"

ENV DEBIAN_FRONTEND=noninteractive

ARG MYSQL_ROOT_PASSWORD=passwd
ARG LDAP_ROOT_PASSWORD=passwd
ARG PMA_USER_PASSWORD=passwd
ARG GRIS_DB_USER_PASSWORD=passwd
ARG LDAP_DOMAIN=nodomain

RUN echo "Europe/Berlin" > /etc/timezone \
        && dpkg-reconfigure -f noninteractive tzdata

RUN echo "deb http://ftp.halifax.rwth-aachen.de/debian/ jessie main" > /etc/apt/sources.list \
        && echo exit 0 > /usr/sbin/policy-rc.d

RUN echo "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD" | debconf-set-selections \
        && echo "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD" | debconf-set-selections

RUN apt-get update && apt-get install -y \
        git \
        vim \
        apache2 \
        php5 \
        php5-ldap \
        php5-mysqlnd \
        libapache2-mod-php5 \ 
        mysql-server 
		
RUN chown -R www-data:www-data /var/lib/php5/

RUN a2enmod rewrite \
        && a2enmod ldap
		
RUN chown -R mysql:mysql /var/lib/mysql \
        && service mysql start \
        && apt-get install -y \ 
        phpldapadmin \
        phpmyadmin
        
RUN echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections \
        && echo "phpmyadmin phpmyadmin/app-password-confirm password $MYSQL_ROOT_PASSWORD" | debconf-set-selections \
        && echo "phpmyadmin phpmyadmin/mysql/admin-pass password $MYSQL_ROOT_PASSWORD" | debconf-set-selections \
        && echo "phpmyadmin phpmyadmin/mysql/app-pass password $MYSQL_ROOT_PASSWORD" | debconf-set-selections \
        && echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections \
        && dpkg-reconfigure phpmyadmin

RUN chown -R mysql:mysql /var/lib/mysql \
        && service mysql start \
        && gunzip -c /usr/share/doc/phpmyadmin/examples/create_tables.sql.gz | mysql --protocol=TCP  --user=root --password=$MYSQL_ROOT_PASSWORD \
        && gunzip -c /usr/share/doc/phpmyadmin/examples/config.sample.inc.php.gz > /etc/phpmyadmin/config.inc.php

RUN sed -i '/controluser/s/^\/\///g' /etc/phpmyadmin/config.inc.php \
        && sed -i '/controlpass/s/^\/\///g' /etc/phpmyadmin/config.inc.php \
        && sed -i '/[Servers]/s/^\/\///g' /etc/phpmyadmin/config.inc.php \
        && sed -i "/controlpass/s/= '.*'/= '$PMA_USER_PASSWORD'/" /etc/phpmyadmin/config.inc.php \
        && sed -i "/DefaultDisplay/s/'vertical'/'horizontal'/g" /etc/phpmyadmin/config.inc.php

RUN chown -R mysql:mysql /var/lib/mysql \
        && service mysql start \
        && mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "GRANT SELECT, INSERT, DELETE, UPDATE ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY '$PMA_USER_PASSWORD'" \
        && mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "GRANT SELECT, INSERT, DELETE, UPDATE ON gris_model.* TO 'gris'@'localhost' IDENTIFIED BY '$GRIS_DB_USER_PASSWORD'"

RUN apt-get install -y slapd ldap-utils

RUN  ulimit -n 1024 \
        && echo "slapd slapd/root_password password $LDAP_ROOT_PASSWORD" | debconf-set-selections \
        && echo "slapd slapd/root_password_again password $LDAP_ROOT_PASSWORD" | debconf-set-selections \
        && echo "slapd slapd/internal/adminpw password $LDAP_ROOT_PASSWORD" | debconf-set-selections \
        && echo "slapd slapd/internal/generated_adminpw password $LDAP_ROOT_PASSWORD" | debconf-set-selections \
        && echo "slapd slapd/password2 password $LDAP_ROOT_PASSWORD" | debconf-set-selections \
        && echo "slapd slapd/password1 password $LDAP_ROOT_PASSWORD" | debconf-set-selections \
        && dpkg-reconfigure slapd

RUN sed -i "/'base'/s/dc=example,dc=com/dc=$LDAP_DOMAIN/" /etc/phpldapadmin/config.php \
        && sed -i "/'bind_id'/s/cn=admin,dc=example,dc=com/cn=admin,dc=$LDAP_DOMAIN/" /etc/phpldapadmin/config.php \
        && sed -i "/hide_template_warning/s/^\/\///;/hide_template_warning/s/false/true/" /etc/phpldapadmin/config.php

COPY ldap/disable_anon_bind.ldif /tmp/disable_anon_bind.ldif
COPY database/schema.sql /tmp/schema.sql

RUN git clone https://git.gesis.org/gris/gris-ose.git /var/www/gris \
    && chown -R www-data:www-data /var/www/gris \
    && sed -i "s/test123/$GRIS_DB_USER_PASSWORD/g" /var/www/gris/init/gris_init_example.inc \
    && sed -i 's/$gris_init_dbhost.":".$gris_init_dbport/\$gris_init_dbhost/g' /var/www/gris/classes/GRIS_DATABASE.php

RUN chown -R mysql:mysql /var/lib/mysql \
        && service mysql start \ 
        && mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e 'CREATE DATABASE gris_model CHARACTER SET utf8 COLLATE utf8_general_ci' \
        && mysql --user=root --password=$MYSQL_ROOT_PASSWORD gris_model < /tmp/schema.sql 

RUN ulimit -n 1024 && service slapd start \
    && ldapadd -Q -Y EXTERNAL -H ldapi:/// -f /tmp/disable_anon_bind.ldif -w $LDAP_ROOT_PASSWORD; exit 0

RUN sed -i "s|$(grep -i 'DocumentRoot' /etc/apache2/sites-enabled/000-default.conf | cut -d' ' -f2)|/var/www/gris|" /etc/apache2/sites-enabled/000-default.conf

USER root

ENTRYPOINT service apache2 start && chown -R mysql:mysql /var/lib/mysql && service mysql start && ulimit -n 1024 && service slapd start && /bin/bash