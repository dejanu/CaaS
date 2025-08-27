# Start flask server/understand app behaviour:
```bash
# start app on default port 8888
python app.py
./app.py

# app runs on flask default 5000
flask run

# start app on port other than default port i.e. 5555
export FLASK_APP=main.py
export FLASK_RUN_PORT=8888
flask run

# will run on 8888
docker build -t bau -f old.Dockerfile .
```

# Containerized app:
```bash
docker build -t dejanualex/python_hello:1.0 .
# port baked into image
docker run --rm -p 5555:8888 dejanualex/python_hello:1.0

docker build -t dejanualex/python_hello:1.1 .
# port as env var
docker run --rm -e FLASK_RUN_PORT=5554 -p 5554:5554 dejanualex/python_hello:1.1

# build with args for port, where 
# PORT is passed at build-time
# It’s promoted into ENV FLASK_RUN_PORT at runtime.

docker build --build-arg PORT=5553 -t dejanualex/python_hello:1.2 .
docker run --rm -p 5553:5553 dejanualex/python_hello:1.2

# cleanup
docker rmi dejanualex/python_hello:1.0 dejanualex/python_hello:1.1 dejanualex/python_hello:1.2
```

