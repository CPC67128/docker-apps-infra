# Internal Docker Registry

This repository provides a **very simple internal Docker Registry** with a **web UI**, intended for **trusted internal networks only**.

It is based on:
- Docker Registry v2 (`registry:2`)
- Docker Registry UI (`joxit/docker-registry-ui`)
- A Docker named volume for persistent storage

No TLS, authentication, or reverse proxy is used by design.

---

## ⚠️ Important Notice

This registry is:
- ✅ intended for **internal use only**
- ✅ deployed on a **trusted network**
- ❌ **NOT secured** (no HTTPS, no authentication)

Do **NOT** expose this service to the Internet.

---

## Architecture

- Docker Registry API: `http://<host>:5000`
- Registry Web UI: `http://<host>:8080`
- Storage: Docker named volume `registry_data`

---

## Prerequisites

- Docker Engine
- Docker Compose v2

---

## Start the Registry

From the directory containing `docker-compose.yml`:

```bash
docker compose up -d