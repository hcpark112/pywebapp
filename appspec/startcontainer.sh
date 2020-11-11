#!/bin/bash
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 313611312004.dkr.ecr.us-west-2.amazonaws.com
docker pull 313611312004.dkr.ecr.us-west-2.amazonaws.com/hcpark112/pywebapp:latest || {
    echo "ERROR: docker pull failed. Sleeping for 10 minutes to allow investigation..."
    sleep 600
    exit 1
}
docker run --name pywebapp -p 80:8080 --detach 313611312004.dkr.ecr.us-west-2.amazonaws.com/hcpark112/pywebapp:latest
