#!/usr/bin/env bash

source util/version.sh

echo "Sopping running '$CONTAINER_NAME' container if any"
docker stop "$CONTAINER_NAME"

echo "Removing '$CONTAINER_NAME' container if any"
docker rm "$CONTAINER_NAME"

echo "Deleting '$VOLUME_NAME' volume if exists"
docker volume rm "$VOLUME_NAME"