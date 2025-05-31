pipeline {
  agent any

  stages {
    stage('Clonar repositorio') {
      steps {
        checkout scm
      }
    }
    stage('Cleanup') {
      steps {
          script {
            // Remove the existing container if it exists
            sh "docker rm -f mi_sitio_web || true"
                }
            }
        }
    stage('Aplicar Terraform') {
      steps {
        dir('terraform') {
            sh 'terraform init'
            sh "terraform apply -var build_number=${buildNumber} -auto-approve"
        }
      }
    }
  }
}
