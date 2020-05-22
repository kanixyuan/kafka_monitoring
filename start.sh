#!/bin/bash

set -e

docker-compose build --no-cache
docker-compose --compatibility up --force-recreate -d
sleep 5
echo 'zoo1 : '
echo mntr | nc localhost 2181
echo 'zoo2 : '
echo mntr | nc localhost 2182
echo 'zoo3 : '
echo mntr | nc localhost 2183