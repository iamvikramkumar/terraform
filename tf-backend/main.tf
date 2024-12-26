terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "put your bucket name here"
    key = "backend.tfstate"
    region = "us-east-1"
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myserver" {
    ami = "ami-0583d8c7a9c35822c"
    instance_type = "t2.micro"
    tags = {
        Name = "myserver"
    }
  
}



# Create a VPC
# resource "aws_vpc" "example" {
#   cidr_block = "10.0.0.0/16"
# }

