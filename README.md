# Standalone start app

```bash
# install dependecies
pip3 install flask
pip3 install prometheus-client

# start flask server
export FLASK_APP=app
python -m flask run

# start prometheus app
python demo_prom.py

# build local docker image
docker build  -f demo/Dockerfile_demo_prom -t dejanualex/prom_web:1.0 .
```