# Repository structure

```
docker-apps-infra/
├── README.md
├── conventions.md
├── networks/
│   └── networks.md
│
├── apps/
│   ├── app1/
│   │   ├── docker-compose.yml
│   │   ├── .env.example
│   │   └── README.md
│   ├── app2/
│
├── db/
│   ├── mariadb/
│
├── edge/
│   ├── reverse-proxy/
│
├── shared/
│   ├── redis/
│
└── ops/
    ├── deploy/ (maybe should be scripts/)
    │   ├── app-vm-01.md > .sh
    │   └── db-vm-01.md > .sh
```

# VM structure

```
app-vm-01:
* Application runtimes (apps, APIs, workers)

db-vm-01:
* Primary data services (MariaDB, PostgreSQL engines)

ops-vm-01: Operational / backend services (backups, maintenance, jobs)
* PostgreSQL logical backups
* MariaDB validation jobs
* integrity checks
* export/sync containers
* retention enforcement

shared-vm-01:
* shared Redis / cache
* shared middleware
* admin UIs
* things used live by apps

edge-vm-01:
The “edge” is the boundary where internal systems meet the outside world (Internet or external networks).
“The part of the network closest to users or external systems”
* Reverse proxies
* Load balancers
* TLS termination
* Firewalls
* Gateways
```