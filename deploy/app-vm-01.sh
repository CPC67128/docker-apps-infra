#!/bin/bash

cd apps/phpmyadmin
# cp .env.example .env
# edit .env
docker compose up -d

cd ../dolibarr
# cp .env.example .env
# edit .env
docker compose up -d

cd ../manalime
docker compose up -d --pull always

cd ../website
docker compose up -d --pull always

cd ../webscraping
docker compose up -d --pull always

cd ../stock-tracker
docker compose up -d --pull always
