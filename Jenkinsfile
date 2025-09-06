pipeline {
    agent any

    tools {
        maven 'Maven' // Must match your Global Tool Configuration
    }

    environment {
        DOCKER_IMAGE = 'wasaththeekshana/student-gscomp314:latest'
        DOCKER_CREDENTIALS = 'jenkeins-docker-access-token' // Docker Hub credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone your GitHub repo from gscomp314 branch
                git branch: 'gscomp314',
                    url: 'https://github.com/wasthTheekshana/NCC_2025.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def image = env.DOCKER_IMAGE

                    // Build and tag Docker image from backend2 directory
                    bat "docker build -t student-gscomp314 backend2"
                    bat "docker tag student-gscomp314 ${image}"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    def image = env.DOCKER_IMAGE

                    withCredentials([usernamePassword(
                        credentialsId: env.DOCKER_CREDENTIALS,
                        usernameVariable: 'USERNAME',
                        passwordVariable: 'PASSWORD'
                    )]) {
                        // Docker login and push
                        bat "echo %PASSWORD% | docker login -u %USERNAME% --password-stdin docker.io"
                        bat "docker push ${image}"
                    }
                }
            }
        }
    }

    post {
        always {
            // Logout from Docker Hub
            bat 'docker logout'
        }
    }
}
