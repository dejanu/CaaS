.DEFAULT_GOAL := documentation

documentation:
	@echo "make info"
	@echo "make clean"
	@echo "make stats"
	@echo "make apps"
	@echo "make airgapped"
info:
	@echo "docker system info --format '{{ .DefaultRuntime }}'"
	@echo "docker info -f '{{ .DockerRootDir}}'"
clean:
	@echo "docker rm \$\(docker ps -aq)"
	@echo "docker image prune -a"
stats:
	@echo "docker system df"
	@echo "docker stats --no-stream"
apps:
	@echo "docker run -d -p 5000:5555 dejanu/python_hello:1.0"
	@echo "docker run -d -p 8082:8080 dejanualex/node_hello:1.0"
	@echo "docker run -d -p 8083:8080 dejanualex/go_hello:1.0"
airgapped:
	@echo "docker save nginx:latest | gzip > nginx.tar.gz"
	@echo "docker load -i nginx.tar.gz"
	@echo "docker run --name nini -p 8080:80 nginx:latest"