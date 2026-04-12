#!/bin/bash

cd apps/phpmyadmin
# cp .env.example .env
# edit .env
docker compose up -d

cd ../../apps/dolibarr
# cp .env.example .env
# edit .env
docker compose up -d


