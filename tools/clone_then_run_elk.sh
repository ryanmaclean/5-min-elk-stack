#!/bin/bash
git clone --recursive https://github.com/ryanmaclean/5-minute-belk-stack.git
docker-compose up -d 5-minute-belk-stack/docker-elk/docker-compose.yml
cd /5-minute-belk-stack/beats-dashboards/
./load.sh -url "http://localhost:9200"
cd ~
echo -e "Now visit \e[4m\e[95mhttp://`ec2metadata --public-hostname`:5601\e[0m in order to get started with ELK!"