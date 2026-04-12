# Repository structure

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
├── shared/
│   ├── reverse-proxy/
│   ├── redis/
│   └── monitoring/
│
└── ops/
    ├── deploy/ (maybe should be scripts/)
    │   ├── app-vm-01.md > .sh
    │   └── db-vm-01.md > .sh


On ops-vm-01, it is natural to later add:

PostgreSQL logical backups
MariaDB validation jobs
integrity checks
export/sync containers
retention enforcement
On ops-vm-01, it is natural to later add:

PostgreSQL logical backups
MariaDB validation jobs
integrity checks
export/sync containers
retention enforcement


app-vm-01Application runtimes (apps, APIs, workers)
db-vm-01Primary data services (MariaDB, PostgreSQL engines)
ops-vm-01Operational / backend services (backups, maintenance, jobs)



shared-vm-01 is appropriate when a VM hosts:

reverse proxy
shared Redis / cache
shared middleware
admin UIs
things used live by apps



