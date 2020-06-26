agent {
    node {
    label 'docker-agent'
    }
    checkout scm
    def customImage = docker.build("codesenju/nodejs-web-app:${env.BUILD_ID}")
    customImage.push()

    customImage.push('latest')
}
