#!/bin/bash
wget http://www.apache.org/dist/mesos/0.28.0/mesos-0.28.0.tar.gz
tar -zxf mesos-0.28.0.tar.gz
cd mesos-0.28.0
./bootstrap
mkdir build
cd build
../configure
make
cd ~
configure-mesos-master
# runit-service enable mesos-master