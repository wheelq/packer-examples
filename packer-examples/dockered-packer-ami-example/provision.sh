#!/bin/bash

if [[ "$(whoami)" != "root" ]]; then
    echo "Switching to root..."
    exec sudo -E -- "$0" "$@"
fi

echo "Sleeping for 30 seconds..."
sleep 30

yum update -y &&
    amazon-linux-extras install docker -y &&
    yum install docker -y &&
    service docker start &&
    usermod -a -G docker ec2-user &&
    docker pull wheelq/python-test:latest &&
    docker run -d -p 8090:5000 wheelq/python-test:latest
