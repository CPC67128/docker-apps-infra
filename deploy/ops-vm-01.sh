#!/bin/bash

cd ops/mysql-cron-backup
# cp .env.example .env
# edit .env
docker compose up -d
# docker compose logs -f --tail=200

