# Start flask server:
```bash
python app.py
flask run
```
# Containerized app:
```bash
docker build -t dejanu/python_hello:1.0 .

docker run -d -p 5555:5555 dejanu/python_hello:1.0

# set credentials
gcloud auth configure-docker

#tag image
docker tag gcr.io/google-samples/hello-app:1.0 gcr.io/PROJECT_ID/quickstart-image:tag1

#push image
docker push gcr.io/PROJECT_ID/quickstart-image:tag1
```

