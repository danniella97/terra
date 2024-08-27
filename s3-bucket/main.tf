provider "aws" {
  region = "us-east-2"  
}


resource "aws_s3_bucket" "danie-s3-bucket" {
  bucket = "danie-s3-bucket"
  # acl    = "private"
}


resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.danie-s3-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "danie-s3-bucket-lock"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}

