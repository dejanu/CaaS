#!/usr/bin/env python
# encoding: utf-8
import json
from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    """ return hello world text in bold"""
    return '<b>Hello World Python!</b>'
    
if __name__ == "__main__":
	app.run(host='0.0.0.0', port=5555)
