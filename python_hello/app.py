#!/usr/bin/env python3
# encoding: utf-8

from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return '<p><hr><center>Hello <b>Python!<b> 🐉 </p>'
    
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8888)
