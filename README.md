# Python app that exposes prometheus metrics

* Standalone `app.py`

 ```bash
export FLASK_APP=hello_app

# default port 5000
flask run --host=0.0.0.0
```

* Client library [prometheus](https://github.com/prometheus/client_python)

Exposes the following metrics on port :5000/metrics: `view_total` and `buy_total`

* Containerizing the app

```bash
# build the image
docker build -t dejanualex/prometheus-flask:1.0 .

# run the image
docker run -p 8080:5000 dejanualex/prometheus-flask:1.0
```
