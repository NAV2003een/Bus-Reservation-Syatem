pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/NAV2003een/Bus-Reservation-Syatem.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build('bus-reservation-system-web')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    dockerImage.run('-d -p 8000:8000')
                }
            }
        }
    }

    post {
        failure {
            echo '❌ Build failed.'
        }
        success {
            echo '✅ Build and deployment successful!'
        }
    }
}
