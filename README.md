# PostgresSQL benchmark sandbox
* Uses [PostgresSQL 15](https://www.postgresql.org/docs/15/index.html)
* Use [pgbench](https://www.postgresql.org/docs/15/pgbench.html)

# Initial DB

The initial tables and data will be created during container startup time from `init.sql` script.

# Benchmark

The main query and update operations executed during benchmark phase located inside `benchmark.sh` script.

## Running benchmark

1. Create new postgresql container with volume using `./create-postgres.sh` script.
2. Wait 5-10 seconds to give PostgresSQL time to fully start in the container.
3. Execute benchmark using `./run-benchmark.sh` script.

# psql client

Connect to running in docker PostgresSQL container using `./psql.sh`

# Benchmark results

Below table show throughput results (number of transactions actually processed):

| Test configuration      | selects.bench | selects_not_null.bench | updates.bench |
|-------------------------|---------------|------------------------|---------------|
| No indexes              | 729           | 620                    | 87_180        |
| Single column index     | 132_687       | 132_092                | 82_503        |
| Multi-column index      | 132_800       | 144_141                | 76_852        |
| Partial index           | 735           | 144_868                | 82_361        |
| Covering index          | 128_306       | 125_319                | 78_481        |
| Partial, Covering index | 727           | 140_132                | 81_387        |


# References

[How partial, covering, and multicolumn indexes may slow down UPDATEs in PostgreSQL](https://postgres.ai/blog/20211029-how-partial-and-covering-indexes-affect-update-performance-in-postgresql)