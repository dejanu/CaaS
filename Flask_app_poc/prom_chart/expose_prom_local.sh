#!/bin/bash

kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-svc-ext

kubectl port-forward svc/prometheus-svc-ext 8088:80
