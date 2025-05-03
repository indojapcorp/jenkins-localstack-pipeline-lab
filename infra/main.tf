provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  endpoints {
    s3 = "http://localstack:4566"
  }
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "my-bucket"
}
