#!/bin/bash

setenforce 0
yum install podman-remote -y
systemctl daemon-reload
systemctl enable --now podman.socket
yum install podman-docker -y

#dnf install java-11-openjdk-devel -y
#wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
#tar xf apache-maven-3.8.1-bin.tar.gz -C /opt
#ln -s /opt/apache-maven-3.8.1 /opt/maven
#printf 'export M2_HOME=/opt/maven\nexport MAVEN_HOME=/opt/maven\nexport PATH=${M2_HOME}/bin:${PATH}' > maven.sh
#mv maven.sh /etc/profile.d
#source /etc/profile.d/maven.sh
#
#git clone https://github.com/rieckpil/blog-tutorials.git
## shellcheck disable=SC2164
#cd blog-tutorials/testcontainers-youtube-series/
#mvn verify

docker build . -t testcontainer-podman -f Dockerfile.centos8
docker run -it --net="host" --rm -v /var/run/docker.sock:/var/run/docker.sock localhost/testcontainer-podman
