#!/usr/bin/env bash

# flas run from repo root
export FLASK_RUN_PORT=8888
export FLASK_APP=./python_hello/app.py

docker rm -f $(docker ps -aq -f  status=exited)
docker rmi dejanualex/pythonhello:1.0
docker rmi dejanualex/gohello:1.0
  
