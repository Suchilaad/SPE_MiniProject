pipeline {
environment { 
        registry = "docker4harshit/calculator" 
        registryCredential = 'docker4harshit' 
        dockerImage = '' 
    }
  agent any
  stages 
    {

    stage ('SCM Checkout') {
            steps {
                git branch: 'main', credentialsId: 'bd76dfcf-5cfb-47b3-8292-f684d72ae500', url: 'https://github.com/NightmareNight-em/devops_calculator'
            }
        }

    stage('mvn goals') {
      steps {
        bat 'mvn clean compile test package'
      }
    }
stage('Building Docker image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
stage('Push image to DockerHub') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                bat "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
        stage('Run Container on Dev Server'){
	steps{
	bat 'docker run -p 8081:8081 -d docker4harshit/calculator:3'
                 }
    }
  }
}