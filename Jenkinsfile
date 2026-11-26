pipeline {
    agent any

    options {
        timestamps()
    }

    stages {
        stage('Install and verify CLI') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'npm ci'
                        sh 'npx playwright-cli --version'
                    } else {
                        bat 'npm ci'
                        bat 'npx playwright-cli --version'
                    }
                }
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    def image = "cli-testing:${env.BUILD_NUMBER}"
                    if (isUnix()) {
                        sh "docker build -t ${image} ."
                    } else {
                        bat "docker build -t ${image} ."
                    }
                }
            }
        }

        stage('Verify Docker image') {
            steps {
                script {
                    def image = "cli-testing:${env.BUILD_NUMBER}"
                    if (isUnix()) {
                        sh "docker run --rm ${image} --version"
                    } else {
                        bat "docker run --rm ${image} --version"
                    }
                }
            }
        }
    }
}
