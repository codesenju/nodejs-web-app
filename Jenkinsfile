  
pipeline {
  agent {
    docker {
      image 'dokcer:dind'
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
