#!/usr/bin/env bash

source version.sh

docker exec -it "$CONTAINER_NAME" /benchmark.sh