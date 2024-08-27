terraform {
  backend "s3" {
    bucket         = "danie-s3-bucket"
    key            = "vpc/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "danie-s3-bucket-lock"
  }
}
