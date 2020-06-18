docker container run --name jenkins-docker --rm --detach \
  --privileged --network jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume "$PWD"/jenkins-docker-certs:/certs/client \
  --volume "$PWD/"jenkins-data:/var/jenkins_home \
  --publish 2376:2376 docker:dind
