pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID = 'test'
    AWS_SECRET_ACCESS_KEY = 'test'
    AWS_REGION = 'us-east-1'
    LOCALSTACK_HOST = 'http://localstack:4566'
  }

  stages {
    stage('Checkout') {
      steps {
        git url: 'https://your-repo-url'
      }
    }

    stage('Provision Infra') {
      steps {
        dir('infra') {
          sh 'terraform init'
          sh 'terraform apply -auto-approve'
        }
      }
    }

    stage('Deploy App') {
      steps {
        dir('app') {
          sh 'aws --endpoint-url=$LOCALSTACK_HOST s3 cp app.py s3://my-bucket'
        }
      }
    }
  }
}
