#!/bin/bash

cd edge/nginx-proxy-manager
docker compose up -d

cd ../../edge/registry
docker compose up -d
