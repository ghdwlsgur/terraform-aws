
resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.main-public-1.id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name               = aws_key_pair.mykeypair.key_name
  user_data              = data.cloudinit_config.cloudinit-example.rendered
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name  = var.INSTANCE_DEVICE_NAME
  volume_id    = aws_ebs_volume.ebs-volume-1.id
  instance_id  = aws_instance.example.id
  skip_destroy = true
}
