5 Minute BELK Stack
===================

## Intro
A set of Cloudformation scripts that make it easy to stand up ElasticSearch, Logstash and Kibana with the plan of feeding them metrics via Beats. 

The platform consists of Docker containers running on Mesos AWS EC2 slaves scheduled by Marathon and Chronos. 

## Setting Up Your Stack
Start by creating a VPC with internet gateway, one subnet (with 0.0.0.0/0 route to IGW), EC2 key, and one seccurity group that allows 22 (or port of your choice), 2151 and 8181. 

Next, create the first stack using the `zookeeper.json` file:

```
aws cloudformation create-stack --capabilities CAPABILITY_IAM \\
--stack-name FIVEMINELKZOO \\
--template-body file:///home/ec2-user/5-minute-belk-stack/zookeeper.json && \\
watch aws cloudformation describe-stack-events --stack-name FIVEMINELKZOO
```

If you so desire, you can SSH to one of the hosts from your node to check things out:

```
ssh -o "StrictHostKeyChecking no" \\
-i ~/.ssh/YOURFANCY.pem ubuntu@$(aws ec2 describe-instances | \\
grep PrivateIpAddress | cut -d ':' -f 2 | \\
head -1 | tr -d "\," | tr -d "\"" | cut -c 2-)
```

Follow that up by adding `mesos-master.json` and `mesos-slave.json` into your Cloudformation S3 bucket. Take note of the location of both of these as you'll need the for the next step. 

Now run Cloudformation for the `mesos.json` file. 
