# MariaDB (shared service)

## Purpose
Shared MariaDB instance for multiple applications.

## Files
- docker-compose.yml : runs MariaDB as a container with persistent storage
- .env              : runtime configuration (do NOT commit)
- .env.example      : template for configuration

## Networks
- Uses external Docker network: `back` (must exist on the target VM).

Create it once on the VM:
```bash
docker network create back