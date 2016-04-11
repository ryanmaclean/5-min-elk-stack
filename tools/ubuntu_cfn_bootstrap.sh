#!/bin/bash
# AWS Cloudformation Bootstrap Install
wget https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz
tar -xvf aws-cfn-bootstrap-latest.tar.gz
cd aws-cfn-bootstrap-1.4/
sudo easy_install .