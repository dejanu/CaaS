# CaaS
HelloWorld boiler plates

* Go [app](https://github.com/dejanu/CaaS/blob/master/go_hello/README.md)
* Node [app](https://github.com/dejanu/CaaS/tree/master/js_hello/README.md)
* Python [app](https://github.com/dejanu/CaaS/blob/master/python_hello/README.md)
* Java [app](https://github.com/dejanu/CaaS/blob/master/java_hello/README.md)

# Build images:
```bash
cd <app_dir>
docker build -t dejanu/<app>_hello:1.0 .

# build from remote git repo (disable buildkit)
docker build -t test https://github.com/dejanu/sretoolkit.git#container:docker --no-cache
```

# Start containers:
```bash
docker run -d -p 5000:5555 dejanu/python_hello:1.0
docker run -d -p 8082:8080 dejanualex/node_hello:1.0
docker run -d -p 8083:8080 dejanualex/go_hello:1.0
```
# Gist:

[docker_engine.sh](https://gist.github.com/dejanu/b4e15c76851502660ec1d43d3018b9c0)

# Podman stuff:
```bash
podman pull docker.io/library/alpine:latest
```