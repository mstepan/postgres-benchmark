#!/usr/bin/env bash

source version.sh

docker exec -it "$CONTAINER_NAME" psql -U postgres

