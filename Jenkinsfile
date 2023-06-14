pipeline {
    agent any
    environment { 
        DOCKRHUB_CREDENTIALS=credentials('1145501e-126d-4904-9f71-3e2247a72248')
    }
    stages {
        stage('Clone repository') {
            steps {
                git 'https://github.com/sekharpe/web_application.git'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t web_application_1:latest .'
            }
        }
        stage('login') {
            steps {
            sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push to DockerHub') {
            steps {
                    sh 'docker push sekhar89/web_application_1:latest'
                }
            }
        post {
            always {
                sh 'docker logout'
            }
        }
    }
