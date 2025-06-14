pipeline {
    agent any

    environment {
        VENV_DIR = 'venv'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/NAV2003een/Bus-Reservation-Syatem.git'
            }
        }

        stage('Setup Python Environment') {
            steps {
                bat '''
                python --version
                python -m venv %VENV_DIR%
                call %VENV_DIR%\\Scripts\\activate
                pip install --upgrade pip
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Migrations') {
            steps {
                bat '''
                call %VENV_DIR%\\Scripts\\activate
                python manage.py makemigrations
                python manage.py migrate
                '''
            }
        }

        stage('Run Tests') {
            steps {
                bat '''
                call %VENV_DIR%\\Scripts\\activate
                python manage.py test
                '''
            }
        }
    }

    post {
        failure {
            echo "❌ Pipeline failed."
        }
        success {
            echo "✅ Build and test completed successfully!"
        }
    }
}
