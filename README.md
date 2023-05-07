# CaaS
HelloWorld boiler plates

# Build images:
```bash
cd <app_dir>
docker build -t dejanu/<app>_hello:1.0 .
```

# Start containers:
```bash
docker run -d -p 5000:5555 dejanu/python_hello:1.0
docker run -d -p 8082:8080 dejanualex/node_hello:1.0
docker run -d -p 8083:8080 dejanualex/go_hello:1.0
```
# Gist:

[docker_engine.sh](https://gist.github.com/dejanu/b4e15c76851502660ec1d43d3018b9c0)