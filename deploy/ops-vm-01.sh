#!/bin/bash

cd ops/mysql-cron-backup
# cp .env.example .env
# edit .env
docker compose up -d

cd ../../ops/registry
docker compose down
docker compose up -d

