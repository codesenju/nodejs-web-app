node {
    checkout scm

    docker.withRegistry('https://registry.hub.docker.com', 'dockerHub') {

        def customImage = docker.build("codesenju/nodejs-web-app:${env.BUILD_ID}")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
