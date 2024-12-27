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

data "aws_ami" "name" {
  most_recent = true
  owners = ["amazon"]
}

output "aws_ami" {
  value = data.aws_ami.name.id
}


# Security Group
data "aws_security_group" "name" {
  tags = {
    mywebserver = "http"
  }
}

output "aws_security_group" {
  value = data.aws_security_group.name.id
}

#VPC id

data "aws_vpc" "name" {
  tags = {
    ENV = "PROD"
    Name = "my-vpc"
  }
}

output "vpc_id" {
  value = data.aws_vpc.name.id
}

#A Z
data "aws_availability_zones" "available" {
  state = "available"
}

output "aws_zones" {
  value = data.aws_availability_zones.available.names
  
}

# TO get account information
data "aws_caller_identity" "name" {}

output "caller_info" {
  value = data.aws_caller_identity.name 
}

data "aws_region" "name" {}
output "name" {
  value = data.aws_region.name
}

resource "aws_instance" "myserver" {
  ami                         = data.aws_ami.name.id
  instance_type               = "t2.micro"

  tags = {
    Name = "myserver"
  }
}