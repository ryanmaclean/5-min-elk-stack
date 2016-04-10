#!/bin/bash
sudo apt-get install libpcap0.8
curl -L -O https://download.elastic.co/beats/packetbeat/packetbeat_1.2.1_amd64.deb
sudo dpkg -i packetbeat_1.2.1_amd64.deb