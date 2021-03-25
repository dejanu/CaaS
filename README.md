# miniature-lamp
hello app goi


# Start app:
`go run hello-world.go`

# Compile app to execute it as binary:
`go build hello-world.go`

# Build image:
```bash
docker build -t dejanu/hell_python:1 .

# set credentials
gcloud auth configure-docker

#tag image
docker tag gcr.io/google-samples/hello-app:1.0 gcr.io/PROJECT_ID/quickstart-image:tag1

#push image
docker push gcr.io/PROJECT_ID/quickstart-image:tag1
```


# Start container:
`docker run -d -p 5555:5555 dejanu/hell_python:1`
