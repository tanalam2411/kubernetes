
```bash
_ironic$ sudo apt-get install build-essential python3-dev libssl-dev python3-pip libmysqlclient-dev libxml2-dev libxslt-dev libpq-dev git git-review libffi-dev gettext ipmitool psmisc graphviz libjpeg-dev
#_ironic$ sudo apt-get install python3-venv
#_ironic$ python3 -m venv venv
#_ironic$ source venv/bin/activate
```

```bash
_ironic$ git clone https://opendev.org/openstack/ironic
_ironic$ cd ironic
_ironic/ironic$ sudo apt update
_ironic/ironic$ sudo apt install python3-pip
_ironic/ironic$ sudo pip3 install -U tox
_ironic/ironic$ sudo pip3 install -U virtualenv
_ironic/ironic$ tox -evenv --notest --develop -r
(venv) _ironic/ironic$ source .tox/venv/bin/activate
(venv) _ironic/ironic$ pip install python-openstackclient
(venv) _ironic/ironic$ pip install python-ironicclient
```

- IRONIC
```bash
(venv) tan@tan-desktop:~/ws/poc/rs/_ironic/ironic$ ironic-api -d --config-file etc/ironic/ironic.conf.local
(venv) tan@tan-desktop:~/ws/poc/rs/_ironic/ironic$ ironic-conductor -d --config-file etc/ironic/ironic.conf.local
```

- IRONIC INSPECTOR
```bash

```

----------------------------------- Dev -------------------------------
- Terminal 1 - IRONIC
```bash
(venv) tan@tan-desktop:~/ws/poc/rs/_ironic/ironic$ ironic-api -d --config-file etc/ironic/ironic.conf.local
```

- Terminal 2 - IRONIC CONDUCTOR
```bash
(venv) tan@tan-desktop:~/ws/poc/rs/_ironic/ironic$ mkdir -p /home/tan/ws/poc/rs/_ironic/ironic/httpboot  # for ipxe
(venv) tan@tan-desktop:~/ws/poc/rs/_ironic/ironic$ ironic-conductor -d --config-file etc/ironic/ironic.conf.local
```

- TERMINAL 3 - IRONIC INSPECTOR
```bash
(py3) tan@tan-desktop:~/ws/poc/rs/_ironic_inspector/ironic-inspector$ ironic-inspector --config-file example.conf
```

- Baremetal Operator
```bash
export OPERATOR_NAME=baremetal-operator
export DEPLOY_KERNEL_URL=http://172.22.0.1/images/ironic-python-agent.kernel
export DEPLOY_RAMDISK_URL=http://172.22.0.1/images/ironic-python-agent.initramfs
export IRONIC_ENDPOINT=http://localhost:6385/v1/
export IRONIC_INSPECTOR_ENDPOINT=http://localhost:5050/v1

$ make install
$ k apply -f examples/example-redfish.yaml -n metal3
$ make run
```

- Sushy Emulator
```bash
(venv) tan@tan-desktop:~/ws/poc/rs/_sushy-tools/sushy-tools$ sushy-emulator
```


