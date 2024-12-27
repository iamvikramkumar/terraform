terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
      }
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  owner = "ABC"
  name = "Myserver"
}

resource "aws_instance" "myserver" {
  ami = "ami-01816d07b1128cd2d"
  instance_type = var.aws_instance_type

  root_block_device {
    delete_on_termination = true
    volume_size = var.ec2_config.v_size
    volume_type = var.ec2_config.v_type
  }

    tags = merge(var.additional_tags,{
        Name = local.name
    })
}

output "aws_instance_id" {
  value = var.aws_instance_type
}