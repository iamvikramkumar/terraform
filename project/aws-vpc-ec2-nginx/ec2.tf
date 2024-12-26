//resources.tf


# EC2 instance For Nginx setup
resource "aws_instance" "nginxserver" {
  ami                         = "ami-01816d07b1128cd2d"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.nginx-sg.id]
  associate_public_ip_address = true


# package installation of nginx
# EOF - > ED OF FILE 
  user_data = <<-EOF
            #!/bin/bash
            sudo yum install nginx -y
            sudo systemctl start nginx
            EOF

  tags = {
    Name = "NginxServer"
  }
}