#!/bin/bash
git clone --recursive https://github.com/ryanmaclean/5-minute-belk-stack.git
docker-compose up -d 5-minute-belk-stack/docker-elk/docker-compose.yml
cd /5-minute-belk-stack/beats-dashboards/
./load.sh -url "http://localhost:9200"
cd ~