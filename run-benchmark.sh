#!/usr/bin/env bash

source util/version.sh

./util/cleanup.sh
./util/create.sh

echo "Sleeping for 10 seconds before running benchmark"
sleep 10

docker exec -it "$CONTAINER_NAME" /benchmark.sh

./util/cleanup.sh