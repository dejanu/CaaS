# Docker engine

```bash
# check the container runtime
docker system info --format "{{ .DefaultRuntime }}"

# check root directory for Docker storage, default is /var/lib/docker
docker info -f '{{ .DockerRootDir}}'

# show docker disk usage
docker system df

# remove stoped containers  
docker rm $(docker ps -aq)

# remove dangling/untagged images and not referenced by a container
docker image prune -a

# containers resource usage
docker stats [OPTIONS] [CONTAINER...]
```

