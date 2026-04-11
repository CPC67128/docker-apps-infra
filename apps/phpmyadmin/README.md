# phpMyAdmin (stack)

## Purpose
Web UI to manage MySQL/MariaDB.

## Network
- back (required)
- front (optional, typically proxy-only)

## Configuration
- Fixed DB host: PMA_HOST (+ optional PMA_PORT) [2](https://www.howtogeek.com/devops/how-to-run-phpmyadmin-in-a-docker-container/)[3](http://underpop.online.fr/p/phpmyadmin/help/docker-environment-variables.htm)
- Or allow choosing server at login: PMA_ARBITRARY=1 [2](https://www.howtogeek.com/devops/how-to-run-phpmyadmin-in-a-docker-container/)[3](http://underpop.online.fr/p/phpmyadmin/help/docker-environment-variables.htm)
- If behind reverse proxy with a full URL/path, set PMA_ABSOLUTE_URI [3](http://underpop.online.fr/p/phpmyadmin/help/docker-environment-variables.htm)[4](http://underpop.online.fr/p/phpmyadmin/help/installing-using-docker.htm)

## Run
docker compose up -d
docker compose logs -f --tail=200
docker compose down
