#!/usr/bin/python

from flask import request, jsonify, Flask, render_template
import platform
import json
import ssl
from prometheus_client import Counter, generate_latest

from cryptography.fernet import Fernet
context = ssl._create_unverified_context()

# create counter metric
view_metric = Counter('view', 'Product view', ['product'])
buy_metric = Counter('buy', 'Product buy', ['product'])
c = Counter('my_requests_total', 'HTTP Failures', ['method', 'endpoint'])

app = Flask(__name__)
app.config["DEBUG"] = True

# endpoint list used in index.htlm
endpoints_list = ["/encrypt?message=HelloWorld&algorithm=A-K","/view/<id>","/buy/<id>", "/metrics"]

@app.route('/', methods = ['GET'])
def index():
    """ homepage """
    return render_template("index.html", machine_info=platform.uname(), endpoints=endpoints_list)

@app.route('/encrypt', methods = ['GET','POST'])
def encrypt_msg():
    """ # http://localhost:8080/encrypt?message=HelloWorld&algorithm=A-K """
    if 'message' in request.args:
        message_from_URL = request.args.get('message')
        if 'algorithm' in request.args:
            algo = request.args.get('algorithm')
            # symmetric encryption/decryption
            key = Fernet.generate_key()
            fernet = Fernet(key)

            # python2: message_from_URL must be encoded to byte string before encryption
            # encMessage = fernet.encrypt(message_from_URL.encode())

            encMessage = fernet.encrypt(bytes(message_from_URL,"utf-8"))

            #create results list
            results = []
            results.append(message_from_URL)
            # shitty bytes in python3 need to be decoded
            results.append(encMessage.decode("utf-8"))
            
            return jsonify(results)

    # go back to index no err handling
        else:
            return render_template("index.html", machine_info=platform.uname(), endpoints=endpoints_list)
    else:
        return render_template("index.html", machine_info=platform.uname(), endpoints=endpoints_list)

@app.route('/view/<id>')
def view_product(id):
    #view_metric.inc()
    view_metric.labels(product=id).inc()
    return '<p> View product {} </p>'.format(id)

@app.route('/buy/<id>')
def buy_product(id):
    #buy_metric.inc()
    buy_metric.labels(product=id).inc()
    return '<p> Buy product {} </p>'.format(id)

@app.route('/metrics')
def metrics():
    return generate_latest()

@app.errorhandler(500)
def handle_500(error):
    return str(error), 500

if __name__ ==  "__main__":
    app.run(host='0.0.0.0', port=8080)
