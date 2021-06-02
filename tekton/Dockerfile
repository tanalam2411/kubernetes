FROM ubuntu:focal

ENV TESTCONTAINERS_RYUK_DISABLED=true
ENV DOCKER_HOST=unix:///var/run/docker.sock

RUN apt update --fix-missing -y

RUN apt install default-jdk -y

RUN apt install wget -y

RUN wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz -P /tmp

RUN tar xf /tmp/apache-maven-*.tar.gz -C /opt

RUN ln -s /opt/apache-maven-3.6.3 /opt/maven

COPY ./maven.sh /etc/profile.d/

RUN apt install git -y

RUN mkdir /myliquibaseplanet

COPY ./myliquibaseplanet /myliquibaseplanet

WORKDIR /myliquibaseplanet

VOLUME ["/var/run/docker.sock"]

CMD ["/opt/apache-maven-3.8.1/bin/mvn", "test", "-Dspring-boot.run.profiles=test"]





# https://mydeveloperplanet.com/2020/05/05/easy-integration-testing-with-testcontainers/
# docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock on2411/testcontainers /opt/apache-maven-3.8.1/bin/mvn test -Dspring-boot.run.profiles=test
# sudo DOCKER_HOST=unix:///var/run/user/1000/podman/podman.sock /opt/apache-maven-3.8.1/bin/mvn -e -X dependency:go-offline test -Dspring-boot.run.profiles=test