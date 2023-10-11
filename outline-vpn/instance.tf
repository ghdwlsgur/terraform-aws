
data "template_file" "user_data" {
  template = file(".payload.sh")
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

resource "aws_instance" "linux" {
  ami                         = var.ec2_amis[var.aws_region]
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = aws_key_pair.vpn_ec2_key.key_name
  user_data                   = data.template_file.user_data.rendered
  vpc_security_group_ids = [
    aws_security_group.linux_security.id
  ]

  provisioner "local-exec" {
    command = "terraform output -raw ssh_private_key > ~/.ssh/${aws_key_pair.vpn_ec2_key.key_name}.pem && chmod 400 ~/.ssh/${aws_key_pair.vpn_ec2_key.key_name}.pem"
  }

  provisioner "local-exec" {
    when        = destroy
    command     = "rm -rf ~/.ssh/vpn_ec2_key.pem"
    working_dir = path.module
  }

  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = "VPN's Server-${var.aws_region}"
  }
}
