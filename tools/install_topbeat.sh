#!/bin/bash
curl -L -O https://download.elastic.co/beats/topbeat/topbeat_1.2.1_amd64.deb
sudo dpkg -i topbeat_1.2.1_amd64.deb
sudo /etc/init.d/topbeat start

# RPM-based Distros
#
#curl -L -O https://download.elastic.co/beats/topbeat/topbeat-1.2.1-x86_64.rpm
#sudo rpm -vi topbeat-1.2.1-x86_64.rpm
#sudo /etc/init.d/topbeat start