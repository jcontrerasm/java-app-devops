pipeline {

  agent any

  stages {
    stage('Authentication') {
      steps {
        echo 'authentication...'
        sh 'make login'
      }
    }

    stage('Build') {
      steps {
        echo 'Building application...'
        sh 'make build'
      }
    }

    stage('Test') {
      steps {
        echo 'Testing application...'
        sh 'make test'
      }
    }

    stage('Publish') {
      steps {
        echo 'Publish application...'
        sh 'make publish'
      }
    }
  }

  post {
    always {
      echo 'Publishing test results...'
      junit '**/target/surefire-reports/*.xml'
    }
  }
}
