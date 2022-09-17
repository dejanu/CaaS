#!/usr/bin/env python
# encoding: utf-8

from crypt import methods
from flask import request, jsonify, Flask, render_template
from prometheus_client import Counter, generate_latest

import platform

app = Flask(__name__)

# create counter metric
view_metric = Counter('view', 'Product view', ['product'])
buy_metric = Counter('buy', 'Product buy', ['product'])

endpoints=["/<product>/view","/<product>/buy"]

@app.route('/', methods=["GET"])
def hello():
    """homepage"""
    return render_template("index.html", machine_info=platform.uname(),endpoints=endpoints)

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
