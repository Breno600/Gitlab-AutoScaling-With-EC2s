#!bin/bash

#Variables
URL_GITLAB=$1
TOKEN_GITLAB=$2
ACCESS_KEY=$3
SECRET_KEY=$4
AMI_EC2=$5
REGION_AWS=$6
VPC_AWS=$7
SUBNET_AWS=$8
ZONE_AWS=$9
SECURITY_GROUP_EC2=$10
INSTANCE_TYPE=$11
REGION_AWS=$12
NAME_BUCKET=$13

#Install gitlab-runner
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
apt update
sudo apt-get install gitlab-runner -y

#Install docker+machine
curl -O "https://gitlab-docker-machine-downloads.s3.amazonaws.com/v0.16.2-gitlab.11/docker-machine-Linux-x86_64"
cp docker-machine-Linux-x86_64 /usr/local/bin/docker-machine
chmod +x /usr/local/bin/docker-machine

#Set Variables
echo $URL_GITLAB > $URL_GITLAB
echo $TOKEN_GITLAB > $TOKEN_GITLAB
echo $ACCESS_KEY > $ACCESS_KEY
echo $SECRET_KEY > $SECRET_KEY
echo $AMI_EC2 > $AMI_EC2
echo $REGION_AWS > $REGION_AWS
echo $VPC_AWS > $VPC_AWS
echo $SUBNET_AWS > $SUBNET_AWS
echo $ZONE_AWS > $ZONE_AWS
echo $SECURITY_GROUP_EC2 > $SECURITY_GROUP_EC2
echo $INSTANCE_TYPE > $INSTANCE_TYPE
echo $REGION_AWS > $REGION_AWS
echo $NAME_BUCKET > $NAME_BUCKET

#Move Configuration to etc/gitlab-runner
mv ./gitlab-runner-config /etc/gitlab-runner

#Restar and start runner
gitlab-runner restart
gitlab-runner run
