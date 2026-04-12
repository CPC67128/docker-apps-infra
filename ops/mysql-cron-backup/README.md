# MariaDB backups (fradelg/mysql-cron-backup)

This repo integrates scheduled MariaDB/MySQL backups using the Docker image:
`fradelg/mysql-cron-backup`.

The container runs `mysqldump` on a cron schedule and writes backups into `/backup`
(which is bind-mounted to `./backups` in this repo). [2](https://hub.docker.com/r/fradelg/mysql-cron-backup/tags)

## Files

- `compose.yml` – backup service definition
- `.env.example` – configuration template (copy to `.env`)
- `backups/` – backups output folder (created on first run)

## Quick start

```bash
cp .env.example .env
mkdir -p backups
docker compose -f compose.yml up -d