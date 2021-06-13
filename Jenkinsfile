pipeline {
    agent any
    stages {
    // env.PATH = "${tool 'Maven3'}/bin:${env.PATH}"
        stage('Package') {
            steps {
                echo 'Deploying'
                dir('webapp') {
                    sh 'echo Building Maven'
                    // sh 'mvn clean package -DskipTests'
                }
            }      

        }

        stage('Unit Test') {
            steps {
                dir('webapp') {
                    sh 'echo Building Maven'
                // sh 'mvn test'
                }
            }           

        }

        stage('Create Docker Image') { 
            when {
            branch 'master'
            }
            steps {               
                dir('webapp') {
                sh 'echo Creating Docker Image'
                // docker.build("us-bank/docker-jenkins-pipeline:${env.BUILD_NUMBER}")
                }
            }
        }

        stage ('Run Application') {
            when {
            branch 'master'
            }    
            steps {      
                sh 'echo Application start'     
                // sh "DB=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' db`"
                // sh "docker run -e DB_URI=$DB us-bank/docker-jenkins-pipeline:${env.BUILD_NUMBER}"
            }
        }

        stage('Run Integration Tests') {
            when {
            branch 'master'
            }    
            steps {        
                dir('webapp') {
                    sh "echo Testing"
                    // docker.build("us-bank/docker-jenkins-pipeline:${env.BUILD_NUMBER}").push()
                    // junit '**/target/surefire-reports/*.xml'
                }
            }
        }

            stage ('Upload Artifacts') {    
            when {
            branch 'master'
            }    
            steps {          
                // Run application using Docker image
                sh 'echo upload to ECR'     

            }
        }
    }
}
