### [Install Docker](#install-docker)

* **[Debian 8 (Jessie)](#install-docker_debian-8)**
* **[Windows](#install-docker_windows)**

### [Beginner](#beginner-1)

* **[Build Docker](#build-docker)**

* **[Start Docker](#start-docker)**

* **[Stop Docker](#stop-docker)**

### [Advanced](#advanced-1)

* **[Build Docker](#build-docker-1)**

* **[Run Docker](#run-docker-1)**

* **[Start services](#start-services-1)**

# Install Docker

**[Official Docker website](https://www.docker.com/)**

> Docker is an open source project to pack, ship and run any application as a lightweight container.

### Debian 8
**[Official install instruction from docker](https://docs.docker.com/engine/installation/linux/debian/)**

```bash
echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list 

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
--recv-keys 58118E89F3A912897C070ADBF76221572C52609D

apt update 

apt install docker-engine

service docker start
```

### Windows
**[Official install instruction from docker](https://docs.docker.com/engine/installation/windows/)**

> The Docker Toolbox is an installer to quickly and easily install and setup a Docker environment on your computer.

Install [Docker Toolbox](https://www.docker.com/products/docker-toolbox)

# Beginner

### Build Docker

Clone GRIS and switch to directory
```bash
git clone https://git.gesis.org/gris/gris-docker.git
cd gris-docker
```

Build Docker
```bash
chmod u+x gris.sh
./gris.sh build
```

### Start Container
```bash
./gris.sh start 
```

### Stop Container
```bash
./gris.sh stop 
```

### Remove Container
```bash
./gris.sh remove 
```

### Commit Container
```bash
./gris.sh commit
```

### Credentials for GRIS
```bash
username: muster
password: test123
```

### Service URLS
```bash
http://[IP]:[PORT]/phpmyadmin
http://[IP]:[PORT]/phpldapadmin
```

![](https://gesisbox.gesis.org/index.php/s/BVyAQXkvSCH08Kg/download?path=%2F&files=gris-docker.webm)

# Advanced

### Build Docker

Clone GRIS and switch to directory
```bash
git clone https://git.gesis.org/gris/gris-docker.git
cd gris-docker
```
Build Docker
```bash
docker build -t gris \
--build-arg MYSQL_ROOT_PASSWORD='MY_PASSWORD' \
--build-arg LDAP_ROOT_PASSWORD='MY_PASSWORD' \
--build-arg PMA_USER_PASSWORD='MY_PASSWORD' \
--build-arg GRIS_DB_USER_PASSWORD='MY_PASSWORD' \
--build-arg LDAP_DOMAIN='nodomain' \
.
```
Replace MY_PASSWORD with your own.

### Run Docker

```bash
docker run -dt --name=gris -p 8081:80 gris
```

