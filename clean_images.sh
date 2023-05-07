#!/bin/bash

# remove stoped containers  
docker rm $(docker ps -aq)
# remove dangling images and not referenced by a container
docker image prune -a