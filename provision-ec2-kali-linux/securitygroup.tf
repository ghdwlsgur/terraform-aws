data "aws_security_group" "default" {
  name = "default"
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
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


