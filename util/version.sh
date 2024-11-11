#!/usr/bin/env bash

export POSTGRESQL_VERSION=17.0
export CONTAINER_NAME=postgres-$POSTGRESQL_VERSION
export VOLUME_NAME=postgres-$POSTGRESQL_VERSION-data
export RAM_LIMIT=2g
export CPU_LIMIT=2