#!/usr/bin/env bash

source util/version.sh

echo "Creating volume '$VOLUME_NAME'"
docker volume create "$VOLUME_NAME"

echo "RAM limit: $RAM_LIMIT, CPU limit: $CPU_LIMIT"

docker run --name "$CONTAINER_NAME" \
 -e POSTGRES_PASSWORD=611191 \
 -v ./util/init.sql:/docker-entrypoint-initdb.d/init.sql \
 -v ./util/benchmark.sh:/benchmark.sh \
 -v "$VOLUME_NAME":/var/lib/postgresql/data \
 -d -p 5432:5432 \
 --memory="$RAM_LIMIT" --cpus="$CPU_LIMIT" \
 postgres:"$POSTGRESQL_VERSION"
