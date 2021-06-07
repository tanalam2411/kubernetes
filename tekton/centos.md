```bash
[root@localhost ~]# useradd tan
[root@localhost ~]# passwd tan
Changing password for user tan.
New password: 
BAD PASSWORD: The password is a palindrome
Retype new password: 
passwd: all authentication tokens updated successfully.

[root@localhost ~]# usermod -aG wheel tan
[root@localhost ~]# id tan
uid=1000(tan) gid=1000(tan) groups=1000(tan),10(wheel)

[root@localhost ~]# su tan
[tan@localhost root]$

[tan@localhost ws]$ sudo yum install podman-remote -y

[tan@localhost ~]$ mkdir -p .config/systemd/user
[tan@localhost ~]$ touch .config/systemd/user/podman.socket

```

```bash
    1  systemctl --user daemon-reload
    2  /etc/init.d/dbus start
    3  sudo systemctl status ssh
    4  systemctl status
    5  id -u tan
    6  echo $XDG_RUNTIME_DIR
    7  export XDG_RUNTIME_DIR=/run/user/1000
    8  systemctl --user daemon-reload
    9  loginctl enable-linger $username
   10  systemctl --user daemon-reload
   11  exit
   12  pwd
   13  cd /home/tan/
   14  ll
   15  ml -lrta
   16  ls -lrta
   17  mkdir ws
   18  cd ws/
   19  podman -v
   20  podman ls
   21  podman ps
   22  podman ps -a
   23  podman images
   24  sudo yum install podman-remote -y
   25  cat .config/systemd/user/podman.socket
   26  vi .config/systemd/user/podman.socket
   27  cd
   28  ls -lrta
   29  touch .config/systemd/user/podman.socket
   30  mkdir -p .config/systemd/user
   31  touch .config/systemd/user/podman.socket
   32  vi .config/systemd/user/podman.socket
   33  touch .config/systemd/user/podman.service
   34  vi .config/systemd/user/podman.service
   35  systemctl --user daemon-reload
   36  systemctl --tan daemon-reload
   37  systemctl --user daemon-reload
   38  echo $DBUS_SESSION_BUS_ADDRESS
   39  cat /etc/ssh/sshd_config 
   40  sudo cat /etc/ssh/sshd_config 
   41  sudo cat /etc/ssh/sshd_config 
   42  export XDG_RUNTIME_DIR=/run/user/$(id -u)
   43  systemctl --user daemon-reload
   44  systemctl --user daemon-reload
   45  bash
   46  exit
   47  systemctl --user daemon-reload
   48  systemctl --user enable --now podman.socket
   49  export DOCKER_HOST=unix:///var/run/tan/podman.sock
   50  podman-remote info
   51  podman system service -t 0 --log-level=debug
   52  systemctl --user enable --now podman.socket
   53  podman system service -t 0 --log-level=debug
   54  XDG_RUNTIME_DIR=/run/user/$UID systemctl --user
   55  podman system service -t 0 --log-level=debug


   1  systemctl --user daemon-reload
    2  /etc/init.d/dbus start
    3  sudo systemctl status ssh
    4  systemctl status
    5  id -u tan
    6  echo $XDG_RUNTIME_DIR
    7  export XDG_RUNTIME_DIR=/run/user/1000
    8  systemctl --user daemon-reload
    9  loginctl enable-linger $username
   10  systemctl --user daemon-reload
   11  exit
   12  pwd
   13  cd /home/tan/
   14  ll
   15  ml -lrta
   16  ls -lrta
   17  mkdir ws
   18  cd ws/
   19  podman -v
   20  podman ls
   21  podman ps
   22  podman ps -a
   23  podman images
   24  sudo yum install podman-remote -y
   25  cat .config/systemd/user/podman.socket
   26  vi .config/systemd/user/podman.socket
   27  cd
   28  ls -lrta
   29  touch .config/systemd/user/podman.socket
   30  mkdir -p .config/systemd/user
   31  touch .config/systemd/user/podman.socket
   32  vi .config/systemd/user/podman.socket
   33  touch .config/systemd/user/podman.service
   34  vi .config/systemd/user/podman.service
   35  systemctl --user daemon-reload
   36  systemctl --tan daemon-reload
   37  systemctl --user daemon-reload
   38  echo $DBUS_SESSION_BUS_ADDRESS
   39  cat /etc/ssh/sshd_config 
   40  sudo cat /etc/ssh/sshd_config 
   41  sudo cat /etc/ssh/sshd_config 
   42  export XDG_RUNTIME_DIR=/run/user/$(id -u)
   43  systemctl --user daemon-reload
   44  systemctl --user daemon-reload
   45  bash
   46  exit
   47  podman-remote info
   48  curl -s --unix-socket /run/podman/podman.sock http://d/v1.0.0/libpod/info | jq
   49  curl -XPOST --unix-socket /run/podman/podman.sock -v 'http://d/v1.0.0/images/create?fromImage=registry.access.redhat.com%2Fubi8%2Fubi'
   50  curl -XPOST --unix-socket /run/user/1000/podman/podman.sock -v 'http://d/v1.0.0/images/create?fromImage=registry.access.redhat.com%2Fubi8%2Fubi'
   51  curl --unix-socket /run/podman/podman.sock -v 'http://d/v1.0.0/libpod/images/json' | jq
   52  curl --unix-socket /run/user/1000/podman/podman.sock -v 'http://d/v1.0.0/libpod/images/json' | jq
   53  podman-remote info
   54  podman -v
   55  podman system connection list
   56  curl -sS --unix-socket curl --unix-socket /run/user/1000/podman/podman.sock http://localhost/version | jq
   57  podman system connection list
   58  podman-remote info
   59  podman --help
   60  curl -sS --unix-socket curl --unix-socket /run/user/1000/podman/podman.sock http://localhost/version | jq
   61  docker info
   62  curl -sS --unix-socket curl --unix-socket /run/user/1000/podman/podman.sock http://localhost/version | jq
   63  ll
   64  git
   65  ll
   66  cd ws/
   67  git clone https://github.com/mydeveloperplanet/myliquibaseplanet.git
   68  cd myliquibaseplanet/
   69  git branch
   70  git branch -a
   71  git checkout feature/testcontainers
   72  git checkout origin/feature/testcontainers
   73  git branch
   74  ll
   75  ls -lrta src/test/resources/
   76  mvn
   77  sudo dnf install java-11-openjdk-devel
   78  java -version
   79  wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz -p /tmp
   80  ls -lrta /tmp/
   81  ls -lrta
   82  pwd
   83  cd /tmp/
   84  wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz 
   85  ll
   86  sudo tar xf apache-maven-3.8.1-bin.tar.gz -C /opt
   87  ls -lrta /opt/
   88  ls -lrta /opt/apache-maven-3.8.1/
   89  ls -lrta /opt/apache-maven-3.8.1/bin/
   90  sudo ln -s /opt/apache-maven-3.8.1 /opt/maven
   91  sudo nano /etc/profile.d/maven.sh
   92  sudo chmod +x /etc/profile.d/maven.sh
   93  source /etc/profile.d/maven.sh
   94  mvn -version
   95  cd ~/ws/myliquibaseplanet/
   96  git branch
   97  export DOCKER_HOST=unix:///run/user/1000/podman/podman.sock mvn test -Dspring-boot.run.profiles=test
   98  export DOCKER_HOST=unix:///run/user/1000/podman/podman.sock
   99  DOCKER_HOST=unix:///run/user/1000/podman/podman.sock mvn test -Dspring-boot.run.profiles=test
  100  DOCKER_HOST=unix:///run/user/1000/podman/podman.sock mvn -X -e test -Dspring-boot.run.profiles=test
  101  cat /etc/containers/registries.conf 
  102  vi /etc/containers/registries.conf 
  103  sudo vi /etc/containers/registries.conf 
  104  touch src/test/resources/testcontainers.properties
  105  vi src/test/resources/testcontainers.properties
  106  DOCKER_HOST=unix:///run/user/1000/podman/podman.sock mvn -X -e test -Dspring-boot.run.profiles=test
  107  vi src/test/resources/testcontainers.properties
  108  sudo vi /etc/containers/registries.conf 
  109  DOCKER_HOST=unix:///run/user/1000/podman/podman.sock mvn -X -e test -Dspring-boot.run.profiles=test
  110  podman images
  111  podman image rm quay.io/testcontainers/ryuk
  112  podman image --help
  113  podman images
  114  podman image rm 64849fd2d464
  115  podman images
  116  DOCKER_HOST=unix:///run/user/1000/podman/podman.sock mvn -X -e test -Dspring-boot.run.profiles=test
  117  vi 
  118  DOCKER_HOST=unix:///run/user/1000/podman/podman.sock mvn -X -e test -Dspring-boot.run.profiles=test
  119  export TESTCONTAINERS_RYUK_DISABLED=true
  120  DOCKER_HOST=unix:///run/user/1000/podman/podman.sock mvn -X -e test -Dspring-boot.run.profiles=test
  121  podman system prune -af
  122  DOCKER_HOST=unix:///run/user/1000/podman/podman.sock mvn -X -e test -Dspring-boot.run.profiles=test
  123  vi pom.xml 
  124  ll
  125  vi pom.xml 
  126  DOCKER_HOST=unix:///run/user/1000/podman/podman.sock mvn -X -e test -Dspring-boot.run.profiles=test
  127  export TESTCONTAINERS_RYUK_DISABLED=false
  128  DOCKER_HOST=unix:///run/user/1000/podman/podman.sock mvn -X -e test -Dspring-boot.run.profiles=test
  129  vi pom.xml 
  130  DOCKER_HOST=unix:///run/user/1000/podman/podman.sock mvn -X -e test -Dspring-boot.run.profiles=test
  131* 
  132  DOCKER_HOST=unix:///run/user/1000/podman/podman.sock mvn -X -e test -Dspring-boot.run.profiles=test
  133  vi pom.xml 
  134  DOCKER_HOST=unix:///run/user/1000/podman/podman.sock mvn -X -e test -Dspring-boot.run.profiles=test
  135  vi pom.xml 
  136  DOCKER_HOST=unix:///run/user/1000/podman/podman.sock mvn -X -e test -Dspring-boot.run.profiles=test


    1  systemctl --user daemon-reload
    2  /etc/init.d/dbus start
    3  sudo systemctl status ssh
    4  systemctl status
    5  id -u tan
    6  echo $XDG_RUNTIME_DIR
    7  export XDG_RUNTIME_DIR=/run/user/1000
    8  systemctl --user daemon-reload
    9  loginctl enable-linger $username
   10  systemctl --user daemon-reload
   11  exit
   12  pwd
   13  cd /home/tan/
   14  ll
   15  ml -lrta
   16  ls -lrta
   17  mkdir ws
   18  cd ws/
   19  podman -v
   20  podman ls
   21  podman ps
   22  podman ps -a
   23  podman images
   24  sudo yum install podman-remote -y
   25  cat .config/systemd/user/podman.socket
   26  vi .config/systemd/user/podman.socket
   27  cd
   28  ls -lrta
   29  touch .config/systemd/user/podman.socket
   30  mkdir -p .config/systemd/user
   31  touch .config/systemd/user/podman.socket
   32  vi .config/systemd/user/podman.socket
   33  touch .config/systemd/user/podman.service
   34  vi .config/systemd/user/podman.service
   35  systemctl --user daemon-reload
   36  systemctl --tan daemon-reload
   37  systemctl --user daemon-reload
   38  echo $DBUS_SESSION_BUS_ADDRESS
   39  cat /etc/ssh/sshd_config 
   40  sudo cat /etc/ssh/sshd_config 
   41  sudo cat /etc/ssh/sshd_config 
   42  export XDG_RUNTIME_DIR=/run/user/$(id -u)
   43  systemctl --user daemon-reload
   44  systemctl --user daemon-reload
   45  bash
   46  exit
   47  podman images
   48  vi .docker/config.json
   49  sudo vi .docker/config.json
   50  touch .docker/config.json
   51  mkdir .docker
   52  touch .docker/config.json
   53  vi .docker/config.json
   54  podman images
   55  ll
   56  cd ws/
   57  gi
   58  git clone https://github.com/pkainulainen/test-with-spring.git
   59  cd test-w
   60  git clone https://github.com/merikan/testcontainers-demo.git
   61  cd testcontainers-demo/
   62  vi pom.xml 
   63  cd faster/
   64  pwd
   65  vi pom.xml 
   66  vi src/test/resources/testcontainers.properties
   67  mvn clean test verify
   68  DOCKER_HOST=unix:///run/user/1000/podman/podman.sock mvn clean test verify


export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.11.0.9-0.el8_3.x86_64
export PATH=$PATH:$JAVA_HOME/bin



```

---

```bash
    1  podman-remote info
    2  sudo podman-remote info
    3  sudo ls -al /var/run/docker.sock
    4  curl -s --unix-socket /run/podman/podman.sock http://d/v1.0.0/libpod/info | jq
    5  curl -s --unix-socket /var/run/docker.sock http://d/v1.0.0/libpod/info | jq
    6  curl -XPOST --unix-socket /var/run/docker.sock -v 'http://d/v1.0.0/images/create?fromImage=registry.access.redhat.com%2Fubi8%2Fubi'
    7  sudo curl -XPOST --unix-socket /var/run/docker.sock -v 'http://d/v1.0.0/images/create?fromImage=registry.access.redhat.com%2Fubi8%2Fubi'
    8  sudo curl --unix-socket /run/podman/podman.sock -v 'http://d/v1.0.0/libpod/images/json' | jq
    9  sudo dnf install java-11-openjdk-devel
   10  java -version
   11  ll
   12  wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz -p /tmp
   13  ll
   14  cd /tmp/
   15  ll
   16  wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz 
   17  ll
   18  wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
   19  sudo tar xf apache-maven-3.8.1-bin.tar.gz -C /opt
   20  sudo ln -s /opt/apache-maven-3.8.1 /opt/maven
   21  sudo nano /etc/profile.d/maven.sh
   22  sudo chmod +x /etc/profile.d/maven.sh
   23  source /etc/profile.d/maven.sh
   24  mvn -version
   25  ls -lrta /usr/lib/jvm/java-11-openjdk
   26  ls -lrta /usr/lib/jvm/java-11-openjdk-11.0.11.0.9-0.el8_3.x86_64/
   27  ls -lrta /usr/lib/jvm/java-11-openjdk-11.0.11.0.9-0.el8_3.x86_64/bin/
   28  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.11.0.9-0.el8_3.x86_64
   29  echo $JAVA_HOME
   30  export PATH=$PATH:$JAVA_HOME/bin
   31  java -v
   32  java -V
   33  java --version
   34  mvn -v
   35  cd
   36  mkdir ws
   37  cd ws
   38  git clone https://github.com/merikan/testcontainers-demo.git
   39  cd testcontainers-demo/
   40  cd faster/
   41  ll
   42  vi pom.xml 
   43  cat /etc/containers/registries.conf 
   44  touch src/test/resources/testcontainers.properties
   45  vi src/test/resources/testcontainers.properties
   46  sudo mvn clean test verify
   47  mvn -v
   48  sudo mvn -v
   49  mvn clean test verify
   50  docker ps
   51  sudo usermod -aG docker $USER
   52  ls -al /var/run/docker.sock
   53  which mvn
   54  sudo mvn clean test verify
   55  sudo /opt/maven/bin/mvn clean test verify
   56  sudo touch /root/.docker/config.json 
   57  sudo rm -rf /root/.docker
   58  sudo touch /root/.docker/config.json 
   59  sudo vi touch /root/.docker/config.json 
   60  sudo vi /root/.docker/config.json 
   61  sudo touch /root/.docker/config.json 
   62  su
   63  sudo /opt/maven/bin/mvn clean test verify
   64  docker ps
   65  docker ps -a
   66  podman ps -a
   67  pwd
   68  sudo su

```


---

```bash
    1  sestatus
    2  sudo setenforce 0
    3  podman ps
    4  ls -al /var/run/docker.sock
    5  ls -al /run/podman/podman.sock
    6* yum install 
    7  ls -al /run/podman/podman.sock
    8  ls -al /var/run/docker.sock
    9  yum install -y podman-remote
   10  podman-remote info
   11  cat /usr/lib/systemd/system/podman.socket 
   12  ls -la /var/run/podman/podman.sock
   13  yum install mlocate -y
   14  updatedb
   15  locate podman.sock
   16  cat /usr/lib/systemd/user/podman.socket
   17  cat /usr/lib/systemd/system/podman.socket
   18  systemctl enable --now podman.socket
   19  podman-remote info
   20  docker ps
   21  podman-remote info | grep -i server
   22  podman-remote info | grep -i run
   23  tail -f /var/log/messages

    1  dnf install java-11-openjdk-devel -y
    2  wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
    3  tar xf apache-maven-3.8.1-bin.tar.gz -C /opt
    4  ln -s /opt/apache-maven-3.8.1 /opt/maven
    5  nano /etc/profile.d/maven.sh
    6  chmod +x /etc/profile.d/maven.sh
    7  source /etc/profile.d/maven.sh
    8  mvn -version
    9  unset JAVA_HOME
   10  mkdir ws
   11  cd ws/
   12  
   13  git clone https://github.com/mydeveloperplanet/myliquibaseplanet.git
   14  cd myliquibaseplanet/
   15  mvn test -Dspring-boot.run.profiles=test
   16  mvn test -e -X -Dspring-boot.run.profiles=test
   17  docker ps
   18  docker ps -a
   19  cd ..
   20  git clone https://github.com/rieckpil/blog-tutorials.git
   21  cd blog-tutorials/testcontainers-youtube-series/
   22  mvn verify

```

---

---

```bash
    1  setenforce 0
    2  yum install -y podman-remote
    3  systemctl enable --now podman.socket
    4  dnf install java-11-openjdk-devel -y
    5  wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
    6  tar xf apache-maven-3.8.1-bin.tar.gz -C /opt
    7  nano /etc/profile.d/maven.sh
    8  chmod +x /etc/profile.d/maven.sh
    9  source /etc/profile.d/maven.sh
   10  unset JAVA_HOME
   11  git clone https://github.com/mydeveloperplanet/myliquibaseplanet.git
   12  cd myliquibaseplanet/
   13  cd ..
   14  git clone https://github.com/rieckpil/blog-tutorials.git
   15  cd blog-tutorials/testcontainers-youtube-series/
   16  mvn verify
   17  cat /etc/profile.d/maven.sh
   18  source /etc/profile.d/maven.sh
   19  mvn
   20  cd ../..
   21  tar xf apache-maven-3.8.1-bin.tar.gz -C /opt
   22  chmod +x /etc/profile.d/maven.sh
   23  source /etc/profile.d/maven.sh
   24  mvn
   25  cat /etc/profile.d/maven.sh
   26  wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
   27  tar xf apache-maven-3.8.1-bin.tar.gz -C /opt
   28  ln -s /opt/apache-maven-3.8.1 /opt/maven
   29  mvn
   30  source /etc/profile.d/maven.sh
   31  mvn -version
   32  unset JAVA_HOME
   33  mvn -version
   34  cd blog-tutorials/testcontainers-youtube-series/
   35  mvn verify
   36  yum install podman-docker -y
   37  mvn verify

```

---

```bash
docker build . -t testcontainer-podman -f Dockerfile
docker run -it --net="host" -p 5432:5432 --rm -v /var/run/docker.sock:/var/run/docker.sock localhost/testcontainer-podman
```

```Dockerfile
FROM centos:8


ENV TESTCONTAINERS_RYUK_DISABLED=true
ENV DOCKER_HOST=unix:///var/run/docker.sock

RUN dnf install java-11-openjdk-devel -y
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
#RUN unset JAVA_HOME
RUN dnf install wget -y

RUN wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz

RUN tar xf apache-maven-3.8.1-bin.tar.gz -C /opt

RUN ln -s /opt/apache-maven-3.8.1 /opt/maven


RUN printf 'export M2_HOME=/opt/maven\nexport MAVEN_HOME=/opt/maven\nexport PATH=${M2_HOME}/bin:${PATH}' > maven.sh

RUN mv maven.sh /etc/profile.d

RUN source /etc/profile.d/maven.sh

RUN dnf install git -y

RUN git clone https://github.com/mydeveloperplanet/myliquibaseplanet.git

WORKDIR myliquibaseplanet

RUN git checkout feature/testcontainers

VOLUME ["/var/run/docker.sock"]

CMD ["/opt/apache-maven-3.8.1/bin/mvn", "-e", "-X", "test", "-Dspring-boot.run.profiles=test"]
#CMD ["/opt/apache-maven-3.8.1/bin/mvn", "verify"]
#CMD ["sleep 3000"]

```