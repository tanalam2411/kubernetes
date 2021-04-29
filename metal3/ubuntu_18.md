```bash
$ lscpu | grep -i virtualization
Virtualization:      VT-x
Virtualization type: full

tan@tan:~$ sudo apt-get install build-essential python3-dev libssl-dev python3-pip libmysqlclient-dev libxml2-dev libxslt-dev libpq-dev git git-review libffi-dev gettext ipmitool psmisc graphviz libjpeg-dev -y

tan@tan:~$ mkdir ws
tan@tan:~$ cd ws/
tan@tan:~/ws$ 

tan@tan:~/ws$ sudo apt-get install python3-venv
tan@tan:~/ws$ mkdir _ironic
tan@tan:~/ws$ cd _ironic/
tan@tan:~/ws/_ironic$ git clone https://opendev.org/openstack/ironic
tan@tan:~/ws/_ironic/ironic$ sudo apt install python3-pip -y
tan@tan:~/ws/_ironic/ironic$ sudo pip3 install -U tox
tan@tan:~/ws/_ironic/ironic$ tox -evenv --notest --develop -r
tan@tan:~/ws/_ironic/ironic$ . .tox/venv/bin/activate
(venv) tan@tan:~/ws/_ironic/ironic$ pip install python-ironicclient
(venv) tan@tan:~/ws/_ironic/ironic$ export OS_AUTH_TYPE=none
(venv) tan@tan:~/ws/_ironic/ironic$ export OS_ENDPOINT=http://localhost:6385/
(venv) tan@tan:~/ws/_ironic/ironic$ tox -egenconfig
```

```bash
(venv) tan@tan:~/ws/_ironic/ironic$ cp etc/ironic/ironic.conf.sample etc/ironic/ironic.conf.local
(venv) tan@tan:~/ws/_ironic/ironic$ sed -i "s/#auth_strategy = keystone/auth_strategy = noauth/" etc/ironic/ironic.conf.local
(venv) tan@tan:~/ws/_ironic/ironic$ sed -i "s/#enabled_hardware_types = .*/enabled_hardware_types = fake-hardware/" etc/ironic/ironic.conf.local
(venv) tan@tan:~/ws/_ironic/ironic$ sed -i "s/#enabled_deploy_interfaces = .*/enabled_deploy_interfaces = fake/" etc/ironic/ironic.conf.local
(venv) tan@tan:~/ws/_ironic/ironic$ sed -i "s/#enabled_boot_interfaces = .*/enabled_boot_interfaces = fake/" etc/ironic/ironic.conf.local
(venv) tan@tan:~/ws/_ironic/ironic$ sed -i "s/#enabled_management_interfaces = .*/enabled_management_interfaces = fake,ipmitool/" etc/ironic/ironic.conf.local
(venv) tan@tan:~/ws/_ironic/ironic$ sed -i "s/#enabled_power_interfaces = .*/enabled_power_interfaces = fake,ipmitool/" etc/ironic/ironic.conf.local
(venv) tan@tan:~/ws/_ironic/ironic$ sed -i "s/#sync_power_state_interval = 60/sync_power_state_interval = 604800/" etc/ironic/ironic.conf.local
(venv) tan@tan:~/ws/_ironic/ironic$ sed -i "s/#rpc_transport = oslo/rpc_transport = json-rpc/" etc/ironic/ironic.conf.local


```