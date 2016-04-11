#!/bin/bash
# Install Filebeat
curl -L -O https://download.elastic.co/beats/filebeat/filebeat_1.2.1_amd64.deb
sudo dpkg -i filebeat_1.2.1_amd64.deb
curl -XPUT 'http://localhost:9200/_template/filebeat' -d@/etc/filebeat/filebeat.template.json
sudo /etc/init.d/filebeat start