#!/usr/bin/env bash

source util/version.sh

docker exec -it "$CONTAINER_NAME" psql -U postgres

