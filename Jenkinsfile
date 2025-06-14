pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/NAV2003een/Bus-Reservation-Syatem.git'
            }
        }

        stage('Setup Python Environment') {
            steps {
                bat 'python -m venv venv'
                bat 'venv\\Scripts\\pip install --upgrade pip'
                bat 'venv\\Scripts\\pip install -r requirements.txt'
            }
        }

        stage('Run Migrations') {
            steps {
                bat 'venv\\Scripts\\python manage.py makemigrations'
                bat 'venv\\Scripts\\python manage.py migrate'
            }
        }

        stage('Run Tests') {
            steps {
                bat 'venv\\Scripts\\python manage.py test'
            }
        }
    }

    post {
        failure {
            echo '❌ Pipeline failed.'
        }
        success {
            echo '✅ Pipeline succeeded!'
        }
    }
}
