# Server Setup

## Operating System

Proxmox / Ubuntu 24.04 LTS

```
# apt update
# apt full-upgrade
# timedatectl set-timezone Europe/Paris
# timedatectl
```

## Docker

https://docs.docker.com/engine/install/ubuntu/

```
# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl status docker

sudo docker run hello-world
```

```
:/srv# git clone https://github.com/CPC67128/docker-apps-infra.git
```

```
docker network create front
docker network create back
```

## GitHub Runner

```
sudo useradd -m -s /bin/bash github-runner
sudo usermod -aG sudo github-runner
sudo su - github-runner
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.333.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.333.1/actions-runner-linux-x64-2.333.1.tar.gz
tar xzf ./actions-runner-linux-x64-2.333.1.tar.gz
./config.sh --url https://github.com/CPC67128/docker-apps-infra --token XXXXXXXXXXXXXXXXXXXXXXXXX

exit
sudo passwd github-runner
sudo su - github-runner

sudo ./svc.sh install
sudo ./svc.sh start
sudo ./svc.sh status
```

```
cd /srv/docker-apps-infra
git config --global --add safe.directory /srv/docker-apps-infra
sudo chown -R github-runner:github-runner /srv/docker-apps-infra

sudo usermod -aG docker github-runner
sudo systemctl restart actions.runner*
systemctl list-units | grep actions.runner
exit
sudo su - github-runner
id
docker ps
```

# Various commands

## Registry

Delete repository having no tags anymore:

```
github-runner@ops-vm-01:/srv/docker-apps-infra/ops/registry$ curl http://192.168.XXX.XXX:5000/v2/manalime/tags/list
{"name":"manalime","tags":null}

github-runner@ops-vm-01:/srv/docker-apps-infra/ops/registry$ docker exec registry bin/registry garbage-collect --delete-untagged  /etc/docker/registry/config.yml
```

## Tools

sudo apt install ncdu