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

======================================================================================================

TO REVIEW LATER



## Nginx Proxy Manager

https://nginxproxymanager.com/setup/

```
$ nano docker-compose.yml

version: '3.8'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      # These ports are in format <host-port>:<container-port>
      - '80:80' # Public HTTP Port
      - '443:443' # Public HTTPS Port
      - '81:81' # Admin Web Port
      # Add any other Stream port you want to expose
      # - '21:21' # FTP

    # Uncomment the next line if you uncomment anything in the section
    # environment:
      # Uncomment this if you want to change the location of
      # the SQLite DB file within the container
      # DB_SQLITE_FILE: "/data/database.sqlite"

      # Uncomment this if IPv6 is not enabled on your host
      # DISABLE_IPV6: 'true'

    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt

$ sudo docker compose up -d
```

Connect to Nginx Proxy Manager (port 81)

Change default administrator user
- Email:    admin@example.com
- Password: changeme

## Let's Encrypt

https://letsencrypt.org/fr/

?

Will go through Nginx Proxy Manager


## Proxmox / LXC CT - Apache

Template Ubuntu 24.04 LTS

apt update / full-upgrade

Install docker: https://docs.docker.com/engine/install/ubuntu/

