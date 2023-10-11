terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.5.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}


# 키페어 생성
resource "aws_key_pair" "web_admin" {
  key_name   = "web_admin"
  public_key = data.aws_ssm_parameter.secret.value
}

# cat ~/.ssh/id_rsa.pub | pbcopy 
data "aws_ssm_parameter" "secret" {
  name = "/terraform/ssh-key"
}

# security group ssh 생성
resource "aws_security_group" "ssh" {
  name        = "allow_ssh_from_all"
  description = "Allow SSH port from all"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_security_group" "default" {
  name = "default"
}

# ec2 instance 생성
resource "aws_instance" "web" {
  ami           = "ami-063454de5fe8eba79"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.web_admin.key_name
  vpc_security_group_ids = [
    aws_security_group.ssh.id,
    data.aws_security_group.default.id
  ]


  tags = {
    Name = "Terraform's Ubuntu"
  }
}
