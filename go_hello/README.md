# Start go server:
```bash
# Start app on port 8080
go run main.go
# Compile app to execute it as binary:
go build main.go
```

# Containerized app:
```bash
# GO code is divided into packages and packages are further divided into modules.
# to start a new module and avoid go: go.mod file not found in current directory or any parent directory
go mod init github.com/dejanualex/gohello

docker build -t dejanualex/gohello:1.0 .
docker login docker.io
docker push dejanualex/gohello:1.0

# run 
docker run -d -p 8080:8888 dejanualex/gohello:1.0
```
# Versions

* gohello:1.0 = dancing on /hi
```bash
 docker run --rm -p 8880:8888 dejanualex/gohello:1.0
 ```

* gohello:1.1 = party on /hi
```bash
 docker run --rm -p 8880:8888 dejanualex/gohello:1.1
 ```

* Flow
 ```bash
kubectl create deployment demogo --image=dejanualex/gohello:1.0

kubectl expose deploy demogo --name=demogo-svc --type="LoadBalancer" --port=5555 --target-port=8888
```