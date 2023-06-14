pipeline {
    agent any

    stages {
        stage('Clone repository') {
            steps {
                git 'https://github.com/sekharpe/web_application.git'
            }
        }

        stage('Build Docker image') {
            steps {
                sh 'docker build -t web_application_1 .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([string(credentialsId: '1145501e-126d-4904-9f71-3e2247a72248', variable: 'DOCKERHUB_CREDENTIALS')]) {
                    sh 'docker login -u sekhar89 -p $DOCKERHUB_CREDENTIALS'
                    sh 'docker tag web_application_1 sekhar89/web_application_1:latest'
                    sh 'docker push sekhar89/web_application_1:latest'
                }
            }
        }

        stage('Deploy') {
            steps {
                // Add your deployment steps here
                // This could involve deploying the image to your desired environment (e.g., Kubernetes, AWS ECS, etc.)
            }
        }
    }
}
