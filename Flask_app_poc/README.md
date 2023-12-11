# Run app as a stabndalone app:

* If you want to rename the `app.py` file, e.g. `mv app.py main.py`, you need to update env variable `FLASK_APP` `export FLASK_APP=main.py`
```bash
# default port 5000
flask run --host=0.0.0.0
``` 

**Endpoints**:

* /   
Returns the system properties

* /encrypt?message=<MESSAGE_HERE>&algorithm=<ALGO_HERE>  
Encrypts the string message:

* /view/<algo>

* /buy/<algo>

* /metrics

* CLI usage:
```bash   
# POST request
curl -i -H "Content-Type: application/json" -d '{"message":"thest","algorithm":"AK"}' -X POST 127.0.0.1:5000/encrypt`

# GET requestt
curl -X GET "http://127.0.0.1:5000/encrypt?message=salut&algorithm=A-K"
```

* Client library [prometheus](https://github.com/prometheus/client_python): Exposes the following metrics on port :5000/metrics: `view_total` and `buy_total`



# Run app as a container:

* start web service on port 8080 
```bash
# build the image: x.1 for amd64 and 1.x for arm64
docker build -t dejanualex/encryptapi:<TAG> .

# web service without metrics 
docker run -p 8080:5000 dejanualex/encryptapi:1.1

# web service with metrics
docker run -p 8080:5000 dejanualex/encryptapi:2.1
```
