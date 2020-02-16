pipeline {

  agent any

  stages {
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
  }

  post {
    always {
      echo 'Publishing test results...'
      junit '**/target/surefire-reports/*.xml'
    }
  }
}
