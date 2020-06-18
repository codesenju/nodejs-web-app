#!/bin/bash

mkdir -pv $PWD/jenkins-docker-certs
mkdir -pv $PWD/jenkins-data

docker rm -f jenkins-docker
docker container run --name jenkins-docker --rm --detach \
  --privileged --network jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume "$PWD"/jenkins-docker-certs:/certs/client \
  --volume "$PWD/"jenkins-data:/var/jenkins_home \
  --publish 2376:2376 docker:dind
  
docker rm -f jenkins
docker container run --name jenkins --rm --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --volume "$PWD"/jenkins-data:/var/jenkins_home \
  --volume "$PWD"/jenkins-docker-certs:/certs/client:ro \
  --publish 8080:8080 --publish 50000:50000 jenkinsci/blueocean
