terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
  
}

# Create 2 subnets 

locals {
  project = "project-01"
}

resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"  
  
  tags = {
    Name = "${local.project}-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  count = 2

    tags = {
        Name = "${local.project}-subnet-${count.index}"
    }
}

# Create 4 ec2 instances, 2 in each subnet

# resource "aws_instance" "main" {
#     ami = "ami-01816d07b1128cd2d"
#     instance_type = "t2.micro"
#     count = 4
#     subnet_id = element(aws_subnet.main[*].id, count.index % length(aws_subnet.main))
#     #0%2=0, 1%2=1, 2%2=0, 3%2=1

#     tags = {
#         Name = "${local.project}-instance-${count.index}"
#     }
# }


# create 2 subnets and 2 ec2 instances, 1 in each subnet but ami is different, like one i ubunti other one redhat

resource "aws_instance" "main" {
    count = length(var.ec2_config)
    ami = var.ec2_config[count.index].ami
    instance_type = var.ec2_config[count.index].instance_type

    subnet_id = element(aws_subnet.main[*].id, count.index % length(aws_subnet.main))
    #0%2=0, 1%2=1

    tags = {
        Name = "${local.project}-instance-${count.index}"
    }
}



output "aws_subnet_id" {
  value = aws_subnet.main[0].id
}

