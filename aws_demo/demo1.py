#!/usr/bin/env python3

import boto.ec2

AWS_ACCESS_KEY_ID = "AKIAZMRKINCRLSJJBJM4"
AWS_SECRET_ACCESS_KEY = "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"

# create connection to ec2 compute service using credentials above
conn = boto.ec2.connect_to_region(
    "us-east-1", aws_access_key_id=AWS_ACCESS_KEY_ID, aws_secret_access_key=AWS_SECRET_ACCESS_KEY)

# create an instance with the following parameters
# image-id:ami-0ee23bfc74a881de5
# instance-type: t2.micro
# region: us-east-1

# conn.run_instances("ami-0ee23bfc74a881de5", instance_type="t2.micro")


# get what instances are running
reservations = conn.get_all_reservations()
instances = [i.instances for i in reservations]
print(instances)
