# PostgreSQL benchmark sandbox
* Uses [PostgreSQL 12](https://www.postgresql.org/docs/12/)
* Use [pgbench](https://www.postgresql.org/docs/12/pgbench.html)

# Initial DB

The initial tables and data will be created during container stratup time from `init.sql` script.

# Benchmark

The main query and update operations executed during benchmark phase located inside `benchmark.sh` script.

## Running benchmark

1. Create new postgresql container with volume using `./create-postgres.sh` script.
2. Wait 5-10 seconds to give PostgreSQL time to fully start in the container.
3. Execute benchmark using `./run-benchmark.sh` script.

# psql client

Connect to running in docker PostgreSQL container using `./psql.sh`