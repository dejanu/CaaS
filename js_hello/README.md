# Start node server:
```bash
# start app on port 8080
node server.js
```

# Containerized app:
```bash
docker build -t dejanualex/node_hello:1.0 .
docker run -d -p 8082:8080 dejanualex/node_hello:1.0
```
