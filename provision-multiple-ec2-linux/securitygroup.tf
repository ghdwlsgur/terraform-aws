
# VPC Securigy Group 지정 
data "aws_security_group" "default" {
  # name = "default"
  filter {
    name   = "tag:Name"
    values = ["custom-VPC-SG"]
  }
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

data "aws_ssm_parameter" "vpc-id" {
  name = "/terraform/vpc-id"
}

# 보안그룹이 생성될 vpc의 id 추가
resource "aws_security_group" "linux_security" {
  name        = "linux_security"
  description = "Allow SSH port from anywhere"
  vpc_id      = data.aws_ssm_parameter.vpc-id.value
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

