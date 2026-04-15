#!/bin/bash

cd ops/mysql-cron-backup
# cp .env.example .env
# edit .env
docker compose up -d

cd ../registry
docker compose up -d

cd ../gandi-live-dns
docker compose up -d

