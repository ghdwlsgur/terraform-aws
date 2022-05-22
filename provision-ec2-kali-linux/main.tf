terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "tls_private_key" "tls" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kali" {
  key_name   = "kali"
  public_key = tls_private_key.tls.public_key_openssh
}

data "template_file" "user_data" {
  template = file(".payload.sh")
}

resource "aws_default_subnet" "default" {
  availability_zone = var.availability_zone
}

resource "aws_security_group" "kali_security" {
  name        = "kali_security"
  description = "Allow SSH port from Only my IP"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }
}

data "aws_security_group" "default" {
  name = "default"
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

data "aws_ssm_parameter" "kali_image" {
  name = "/terraform/kali_image"
}

resource "aws_instance" "kali_linux" {
  ami                         = data.aws_ssm_parameter.kali_image.value
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  associate_public_ip_address = true
  key_name                    = aws_key_pair.kali.key_name
  user_data                   = data.template_file.user_data.rendered
  subnet_id                   = var.subnet_id == null ? aws_default_subnet.default.id : var.subnet_id
  vpc_security_group_ids = [
    aws_security_group.kali_security.id,
    data.aws_security_group.default.id
  ]

  provisioner "local-exec" {
    command = "terraform output -raw ssh_private_key > ~/.ssh/${aws_key_pair.kali.key_name}.pem && chmod 400 ~/.ssh/${aws_key_pair.kali.key_name}.pem"
  }

  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = "Kali Linux"
  }
}
