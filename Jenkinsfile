pipeline {
  environment {
    registry = "codesenju/nodejs-web-app"
    registryCredential = 'DockerHub'
    dockerImage = ''
  }
  agent {
    docker {
      image 'docker:dind'
      args '-v /var/run/docker.sock:/var/run/docker.sock'
    }

  }
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/codesenju/nodejs-web-app.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }

    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            dockerImage.push("latest")
          }
        }
      }
    }
    stage('Clean') {
      steps{
        sh 'docker images'
        sh 'docker rmi $registry:$BUILD_NUMBER'
        sh 'docker rmi $registry:latest'
        sh 'docker images'
      }
    }
  }
}
