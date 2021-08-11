pipeline {

    agent { label "master" }

    tools {
        maven 'maven-3.8.1'
        jdk 'jdk-8'
    }

    options {
      gitlabCommitStatus(name: 'jenkins')
    }

    triggers {
        gitlab(triggerOnPush: true, branchFilterType: "NameBasedFilter",  includeBranchesSpec: "master", excludeBranchesSpec: "")
    }

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
            	sh "docker run -p 8080:8080 ${IMAGE}"
            }
        }
    }

        post {
            always {
                cleanWs(cleanWhenAborted: true,
                cleanWhenFailure: true,
                cleanWhenNotBuilt: false,
                cleanWhenSuccess: true,
                cleanWhenUnstable: true)
            }

        }


}