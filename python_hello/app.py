#!/usr/bin/env python3
# encoding: utf-8
import json
from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    """return hello world text in bold"""
    return '<p><b>Hello World Python!<b>🐉</p>'
    
if __name__ == "__main__":
	app.run(host='0.0.0.0', port=5000)
