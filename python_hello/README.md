# Start flask server:
```bash
# start app on port 5555
python app.py

# start app on port 5555
export FLASK_RUN_PORT=5555
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

