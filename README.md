# Local Services

This is a personal repository that will contain services that I can use to help troubleshoot issues.

# Technical Requirements
## Podman
1. Install `podman` on the host system
2. Configure host system to allow non-root users to run containers
3. Build local vagrant-libvirt container
```bash
podman build -t docker.io/vagrantlibvirt/vagrant-libvirt .
```

## Ansible
1. Install Ansible inside a python virtualenv in `/opt/ansible`
```bash
python3.9 -m venv /opt/ansible
```
```bash
source /opt/ansible/bin/activate ; pip install --upgrade pip ; pip install ansible
```

## Vagrant / Libvirt
1. Add the following function to a shellrc file [[reference](https://github.com/vagrant-libvirt/vagrant-libvirt#using-docker)]
```bash
vagrant(){
  podman run -it --rm \
    -e LIBVIRT_DEFAULT_URI \
    -v /var/run/libvirt/:/var/run/libvirt/ \
    -v /opt/ansible:/opt/ansible \
    -v ~/.vagrant.d/boxes:/vagrant/boxes \
    -v ~/.vagrant.d/data:/vagrant/data \
    -v ~/.vagrant.d/data:/vagrant/tmp \
    -v $(realpath "${PWD}"):${PWD} \
    -w $(realpath "${PWD}") \
    --network host \
    --entrypoint /bin/bash \
    --security-opt label=disable \
    docker.io/vagrantlibvirt/vagrant-libvirt \
      vagrant $@
}
``` 

# Current Services
These services will be documented later.

## DNS
## Red Hat Single Sign-on