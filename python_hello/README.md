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
docker run -d -p 5555:5555 dejanu/python_hello:1.0
```

