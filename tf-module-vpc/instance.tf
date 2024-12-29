module "ec2-instances" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"


  name = "single-instance"

    ami                    = "ami-01816d07b1128cd2d"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.private_subnets[0]

  tags = {
    Name = "module-project"
    Environment = "dev"
  }
}
