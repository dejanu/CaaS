from flask import Flask
from prometheus_client import Counter, generate_latest

app = Flask(__name__)

# create counter metric
view_metric = Counter('view', 'Product view', ['product'])
buy_metric = Counter('buy', 'Product buy', ['product'])

@app.route('/')
def hello():
    return '<p> Hello demooo app </p>'

@app.route('/view/<id>')
def view_product(id):
    
    #view_metric.inc()
    view_metric.labels(product=id).inc()
    return '<p> View product {} </p>'.format(id)

@app.route('/buy/<id>')
def buy_product(id):
    buy_metric.labels(product=id).inc()
    return '<p> Buy product {} </p>'.format(id)

@app.route('/metrics')
def metrics():
    return generate_latest()
