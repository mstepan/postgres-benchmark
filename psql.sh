#!/usr/bin/env bash

POSTGRESQL_VERSION=12.0
CONTAINER_NAME=postgres-$POSTGRESQL_VERSION

docker exec -it $CONTAINER_NAME psql -U postgres

