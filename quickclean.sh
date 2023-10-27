#!/usr/bin/env bash

docker rm -f $(docker ps -aq -f  status=exited)
docker rmi -f $(docker images -aq)
docker image prune -a
