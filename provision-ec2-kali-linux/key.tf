resource "tls_private_key" "tls" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kali" {
  key_name   = "kali"
  public_key = tls_private_key.tls.public_key_openssh
}
