# CaaS
HelloWorld boiler plates

* Go [app](https://github.com/dejanu/CaaS/blob/master/go_hello/README.md)
* Node [app](https://github.com/dejanu/CaaS/tree/master/js_hello/README.md)
* Python [app](https://github.com/dejanu/CaaS/blob/master/python_hello/README.md)
* Java [app](https://github.com/dejanu/CaaS/blob/master/java_hello/README.md)

## Build images:
```bash
cd <app_dir>
docker build -t dejanu/<app>_hello:1.0 .
```

## Start containers:
```bash
docker run -d -p 5000:5555 dejanualex/python_hello:1.0
docker run -d -p 8082:8080 dejanualex/node_hello:1.0
docker run -d -p 8083:8080 dejanualex/go_hello:1.0
```
* Debug [containers](https://github.com/dejanu/debug_containers)

# Gist:

[docker_engine.sh](https://gist.github.com/dejanu/b4e15c76851502660ec1d43d3018b9c0)

# Podman stuff:
```bash
podman pull docker.io/library/alpine:latest
```
## Image for debugging:

* [KubeDebugger](https://github.com/dejanu/KubeDebugger/blob/main/plugins/readme.md)