#!/bin/bash
# Xenial Xerus Beta 2 Fixes for EC2

sudo locale-gen en_CA.UTF-8 en_US.UTF-8
echo "127.0.0.1" `ec2metadata --local-hostname` | sudo tee --append /etc/hosts