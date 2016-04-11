#!/bin/bash
# Install Filebeat
curl -L -O https://download.elastic.co/beats/filebeat/filebeat_1.2.1_amd64.deb
sudo dpkg -i filebeat_1.2.1_amd64.deb
curl -XPUT 'http://localhost:9200/_template/filebeat' -d@/etc/filebeat/filebeat.template.json
sudo /etc/init.d/filebeat start

# RPM-Based Distros
#curl -L -O https://download.elastic.co/beats/filebeat/filebeat-1.2.1-x86_64.rpm
#sudo rpm -vi filebeat-1.2.1-x86_64.rpm
#curl -XPUT 'http://localhost:9200/_template/filebeat' -d@/etc/filebeat/filebeat.template.json
#sudo /etc/init.d/filebeat start