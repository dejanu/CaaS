# Start flask server:
```bash
# start app on port 5555
python app.py

# start app on port 5555
export FLASK_APP=main.py
export FLASK_RUN_PORT=5555
flask run
```
# Containerized app:
```bash
docker build -t dejanu/python_hello:1.0 .
# port baked into image
docker run --rm -p 5555:5555 dejanu/python_hello:1.0

docker build -t dejanu/python_hello:1.1 .
# port as env var
docker run --rm -e FLASK_RUN_PORT=5554 -p 5554:5554 dejanu/python_hello:1.1

# build with args for port
docker build --build-arg PORT=5553 -t dejanu/python_hello:1.2 .
docker run --rm -p 5553:5553 dejanu/python_hello:1.2

# cleanup
docker rmi dejanu/python_hello:1.0 dejanu/python_hello:1.1 dejanu/python_hello:1.2
```

