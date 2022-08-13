

resource "aws_instance" "ubuntu-ssh-server" {
  ami           = "ami-0b9064170e32bde34"
  instance_type = "t2.micro"
  subnet_id     = module.aws-network-configs.test-subnet-a-id
  vpc_security_group_ids = [
    module.aws-network-configs.test-sg-id
  ]
  key_name = aws_key_pair.terraform-key.key_name
  count    = 1
  tags = {
    Name = "test-instance"
  }
  associate_public_ip_address = true
}
