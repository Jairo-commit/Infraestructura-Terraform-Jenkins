pipeline {
  agent any

  stages {
    stage('Clonar repositorio') {
      steps {
        checkout scm
      }
    }

    stage('Aplicar Terraform') {
      steps {
        dir('terraform') {
          sh 'terraform init'
          sh 'terraform apply -auto-approve'
        }
      }
    }
  }
}
