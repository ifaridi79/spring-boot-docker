pipeline {
    agent any

    environment {
        registry = "ifaridi79/springboot-petclinic-2.5.4"
        registryCredential = 'dockerhub-credential'
        dockerImage = ''
    } 

    tools { 
        maven 'Maven 3.8.1' 
        jdk 'jdk9' 
    }

    stages {
        stage('Compile') {
            steps {
                sh 'echo Building Maven'
                sh 'mvn -B -DskipTests clean package'
            }      

        }

        stage('Tests') {
            steps {
                sh 'echo Running the tests'
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }        


        stage('Package Docker Image') { 
            steps {               
                sh 'echo Creating Docker Image'
                script {
                    dockerImage = docker.build registry
                }                
                
            }
        }

        stage ('Upload Artifacts') {       
            steps {          
                sh 'echo uploading Artifact to Docker Registry'  
                script {
                docker.withRegistry( '', registryCredential ) {
                    dockerImage.push("${env.BUILD_NUMBER}")
                    dockerImage.push("latest")
                    }
                }                           
            }
        }

        stage('Clean Up Unused Image') { 
            steps {               
                sh 'echo Cleaning up Docker Image'
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }

    }
}
