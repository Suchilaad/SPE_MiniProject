pipeline {
environment { 
        registry = "suchi135/sci_calc" 
        registryCredential = 'suchi135' 
        dockerImage = '' 
    }
  agent any
  stages 
    {

    stage ('SCM Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Suchilaad/SPE_MiniProject.git'
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
		sh 'docker run -p 8081:8081 -d suchi135/sci_calc'
        }
    }
  }
}
