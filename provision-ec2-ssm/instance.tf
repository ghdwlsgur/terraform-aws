
data "template_file" "user_data" {
  template = file("./scripts/.payload.sh")
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "terraform_linux" {
  ami                         = var.ec2_ami
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data.rendered
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  vpc_security_group_ids = [
    aws_security_group.linux_sg.id
  ]

  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = "Linux Server-${var.aws_region}"
  }
}
