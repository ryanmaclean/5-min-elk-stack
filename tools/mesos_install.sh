#!/bin/bash

# Run an Update Before We Start
sudo apt-get update

# Remove Java Security Profile Prior to Updating JDK
sudo rm -rf /etc/java-7-openjdk/security/java.security

# Install Required Packages for the Mesos Build
sudo apt-get install -y tar wget git openjdk-7-jdk autoconf libtool build-essential python-dev python-boto libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev

# Download, Bootstrap, Build and Install Mesos
wget http://www.apache.org/dist/mesos/0.28.0/mesos-0.28.0.tar.gz
tar -zxf mesos-0.28.0.tar.gz
cd mesos-0.28.0
./bootstrap
mkdir build
cd build
../configure
make
make install

# Return to Our Home
cd ~

# Used in the Mesos Scripts for Our Nodes
# configure-mesos-master
# runit-service enable mesos-master