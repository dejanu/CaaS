# miniature-lamp
hello app repo js

# start app:
`node server.js`

# Build&Push image to gcr.io:
```bash
docker build -t gcr.io/PROJECT_ID/hello-node:v1 .
docker run -d -p 8080:8080 gcr.io/PROJECT_ID/hello-node:v1
gcloud auth configure-docker
docker push gcr.io/PROJECT_ID/hello-node:v1
```
