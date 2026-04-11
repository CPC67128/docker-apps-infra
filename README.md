# Server Setup

Proxmox / Ubuntu 24.04 LTS

```
# apt update
# apt full-upgrade
# timedatectl set-timezone Europe/Paris
# timedatectl
```

https://docs.docker.com/engine/install/ubuntu/

```
:/srv# git clone https://github.com/CPC67128/docker-apps-infra.git
```

```
docker network create front
docker network create back
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






## Portainer

https://docs.portainer.io/start/install-ce/server/docker/linux

```
$ sudo docker volume create portainer_data
$ sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.21.1
$ sudo docker ps
```

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

