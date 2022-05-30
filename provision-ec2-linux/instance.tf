
data "template_file" "user_data" {
  template = file(".payload.sh")
}

provider "aws" {
  region = var.aws_region
}

resource "aws_default_subnet" "default" {
  availability_zone = var.availability_zone
}

resource "aws_instance" "linux" {
  ami                         = var.ec2_ami
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  associate_public_ip_address = true
  key_name                    = aws_key_pair.linux.key_name
  user_data                   = data.template_file.user_data.rendered
  subnet_id                   = var.subnet_id == null ? aws_default_subnet.default.id : var.subnet_id
  vpc_security_group_ids = [
    aws_security_group.linux_security.id
  ]

  provisioner "local-exec" {
    command = "terraform output -raw ssh_private_key > ~/.ssh/${aws_key_pair.linux.key_name}.pem && chmod 400 ~/.ssh/${aws_key_pair.linux.key_name}.pem"
  }

  root_block_device {
    volume_size = var.volume_size
  }


  tags = {
    Name = "Terraform's Linux"
  }
}
