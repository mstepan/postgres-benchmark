#!/usr/bin/env bash

echo "=== ### Benchmark scripts ==="
echo "\\set owner_id random(1, 1000)" > selects.bench
echo "select sum(price) from asset where owner_id = :owner_id;" >> selects.bench

echo "\\set owner_id random(1, 1000)" > selects_not_null.bench
echo "select sum(price) from asset where owner_id = :owner_id and price is not null;" >> selects_not_null.bench

echo "\\set id random(1, 600000)" > updates.bench
echo "update asset set price = price + 10 where id = :id;" >> updates.bench

##################################################################################
# 'pgbench' documentation https://www.postgresql.org/docs/12/pgbench.html
##################################################################################

for test in selects selects_not_null updates; do
  pgbench postgres \
    --username=postgres \
    --no-vacuum \
    --report-latencies --time=30 --progress=10 \
    --jobs=4 --client=12 \
    --protocol=prepared \
    --file="${test}.bench"
done