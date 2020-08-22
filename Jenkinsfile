pipeline {

  environment {
    registry = "km20/mywebapp"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git credentialsId: 'git-creds', url: 'https://github.com/DevOps-MN/docker.git'
      }
    }

    stage('Build image') {
      steps{
        echo 'Starting to build docker image'
        script {
          dockerImage = docker.build registry + ":${dockerTag()}"
        }
      }
    }

    stage('Push Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }

    // stage('Deploy App') {
    //   steps {
    //     script {
    //       kubernetesDeploy(configs: "myweb.yaml", kubeconfigId: "mykubeconfig")
    //     }
    //   }
    // }

  }

}
def dockerTag(){
    def commitId = sh returnStdout: true, script: 'git rev-parse --short HEAD'
	return commitId
}