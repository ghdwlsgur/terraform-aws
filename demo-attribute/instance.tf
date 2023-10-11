resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.private_ip} >> ~/redmax45/terraform-temp/private_ips.txt"
  }
}

output "ip" {
  value = aws_instance.example.public_ip
}
