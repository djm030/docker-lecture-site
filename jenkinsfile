pipeline {
    agent any

    environment {
        DOCKER_COMPOSE_FILE = 'docker-compose.yml'
    }

    stages {
        stage('Build') {
            steps {
                sh 'docker-compose -f $DOCKER_COMPOSE_FILE build'
            }
        }

        stage('Test') {
            steps {
                // 필요한 테스트 명령어를 여기에 작성
                // 예: sh 'docker-compose -f $DOCKER_COMPOSE_FILE run django python manage.py test'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker-compose -f $DOCKER_COMPOSE_FILE down'
                sh 'docker-compose -f $DOCKER_COMPOSE_FILE up -d'
            }
        }
    }
}