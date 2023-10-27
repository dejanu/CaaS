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
go mod init github.com/dejanualex/go_hello

docker build -t dejanualex/go_hello:1.0 .
docker run -d -p 8080:8888 dejanualex/go_hello:1.0
```


