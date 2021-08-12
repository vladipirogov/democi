pipeline {

    agent { label "master" }

    tools {
        maven 'maven-3.8.1'
        jdk 'openjdk-11'
    }

    environment {
        IMAGE = 'demo/ci:1.0'
    }
    stages {
        stage('Information') {
             steps {
                script {
                    sh 'printenv'
                }
             }
        }
        stage('Build') {
            steps {
            	echo "Build docker images"
            	sh 'mvn clean package -DskipTests=true'
            	sh "docker build -t ${IMAGE} ."
            }
        }

        stage('deploy') {

            steps {
            	echo "Start deploy"
            	sh "docker run -d -p 8083:8080 ${IMAGE}"
            }
        }
    }

}