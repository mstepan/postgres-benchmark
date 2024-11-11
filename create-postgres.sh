#!/usr/bin/env bash

source version.sh

echo "Stopping already running container if any"
docker stop "$CONTAINER_NAME"

echo "Removing previous container if any"
docker rm "$CONTAINER_NAME"

echo "Deleting volume '$VOLUME_NAME'"
docker volume rm "$VOLUME_NAME"

echo "Creating volume '$VOLUME_NAME'"
docker volume create "$VOLUME_NAME"

echo "RAM limit: $RAM_LIMIT, CPU limit: $CPU_LIMIT"

docker run --name "$CONTAINER_NAME" \
 -e POSTGRES_PASSWORD=611191 \
 -v ./init.sql:/docker-entrypoint-initdb.d/init.sql \
 -v ./benchmark.sh:/benchmark.sh \
 -v "$VOLUME_NAME":/var/lib/postgresql/data \
 -d -p 5432:5432 \
 --memory="$RAM_LIMIT" --cpus="$CPU_LIMIT" \
 postgres:"$POSTGRESQL_VERSION"
