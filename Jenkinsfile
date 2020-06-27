  
pipeline {
  agent {
    docker {
      image 'docker:dind-rootless'
      args '-v /var/run/docker.socket:/var/run/docker.socket'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh '''ls
docker info
docker build -t codesenju/nodejs-web-app:${BUILD_NUMBER} .
docker tag codesenju/nodejs-web-app:${BUILD_NUMBER} codesenju/nodejs-web-app:latest
docker images'''
      }
    }

  }
}
