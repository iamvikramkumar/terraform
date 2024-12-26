terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
     random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "random_id" "random_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "demo_s3_bucket" {
  bucket = "demo-bucket-${random_id.random_id.hex}"
}

resource "aws_s3_object" "bucket-data"{
  bucket = aws_s3_bucket.demo_s3_bucket.bucket
  source = "./myfile.txt"
  key = "mydata.txt"
}

output "name" {
  value = random_id.random_id.hex
}