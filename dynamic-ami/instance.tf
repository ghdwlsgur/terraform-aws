data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["${element(split(";", var.ami_id_filter[var.linux_distro]), 1)}"]

  filter {
    name   = "name"
    values = ["${element(split(";", var.ami_id_filter[var.linux_distro]), 0)}"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  subnet_id              = var.ENV == "prod" ? module.vpc-prod.public_subnets[0] : module.vpc-dev.public_subnets[0]
  vpc_security_group_ids = [var.ENV == "prod" ? aws_security_group.allow-ssh-prod.id : aws_security_group.allow-ssh-dev.id]
  key_name               = aws_key_pair.mykeypair.key_name
}
