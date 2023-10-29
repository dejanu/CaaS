# Docker engine

```bash
# containers resource usage
docker stats [OPTIONS] [CONTAINER...]
docker stats --no-stream

# docker stats
docker system info

# check the container runtime
docker system info --format "{{ .DefaultRuntime }}"

# check root directory for Docker storage, defaults to /var/lib/docker
docker info -f '{{ .DockerRootDir}}'

# show docker disk usage
docker system df

# format output
docker ps --format 'table {{.Names}}\t{{.Status}}'

# remove stoped containers  
docker rm $(docker ps -aq)

# remove dangling/untagged images and not referenced by a container
docker image prune -a

# debug Docker with systemctl/service and journalctl
systemctl status docker
systemctl daemon-reload
systemctl start docker
service docker restart
journalctl -xeu docker.service
journalctl -u docker

# get events
docker events --filter event=restart --since=60m
docker events --filter event=restart --since=60m > events.log 2>&1
```

