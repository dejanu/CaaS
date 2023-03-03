#!/usr/bin/env python3

from flask import Flask, request, jsonify

import boto.ec2
# AWS Access Key ID
AWS_ACCESS_KEY_ID = "AKIAZMRKINCRLSJJBJM4"
# AWS Secret Access Key
AWS_SECRET_ACCESS_KEY = "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"

# create connection to ec2 in region us-east-1 using the credentials above
conn = boto.ec2.connect_to_region(
    "us-east-1", aws_access_key_id=AWS_ACCESS_KEY_ID, aws_secret_access_key=AWS_SECRET_ACCESS_KEY)


def create_ec2_instance():
    # create ec2 instance of t2.micro and  ami-0ee23bfc74a881de5
    reservation = conn.run_instances(
        'ami-0ee23bfc74a881de5', instance_type='t2.micro')
    # return instance id for previously create instance
    return reservation.instances[0].id


app = Flask(__name__)


@app.route('/hello', methods=['GET'])
def hello():
    # return string with HTML header tag
    i = create_ec2_instance()
    return '<h1>Instance {} created</h1>'.format(i) 

