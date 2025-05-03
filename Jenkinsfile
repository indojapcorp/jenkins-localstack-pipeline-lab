pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID = 'test'
    AWS_SECRET_ACCESS_KEY = 'test'
    AWS_REGION = 'us-east-1'
    LOCALSTACK_HOST = 'localstack:4566'
  }

  stages {
    stage('Checkout') {
      steps {
        git url: 'https://github.com/indojapcorp/jenkins-localstack-pipeline-lab.git' , branch:'main'
      }
    }

    stage('Provision Infra') {
      steps {
        dir('infra') {
          sh 'tflocal init'
          sh 'tflocal apply -auto-approve'
        }
      }
    }

    stage('Deploy App') {
      steps {
        dir('app') {
          sh 'awslocal --endpoint-url=$LOCALSTACK_HOST s3 cp app.py s3://my-bucket'
        }
      }
    }
  }
}
