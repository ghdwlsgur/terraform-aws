data "aws_security_group" "default" {
  name = "default"
}

resource "aws_security_group" "linux_sg" {
  name        = "linux_sg"
  description = "linux_sg"

  tags = {
    Name = "linux_sg"
  }
}

resource "aws_security_group_rule" "inbound" {
  type              = "ingress"
  description       = "Allow 443 port from only my ip"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
  security_group_id = aws_security_group.linux_sg.id
}

resource "aws_security_group_rule" "outbound" {
  type              = "egress"
  description       = "Allow to anywhere"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.linux_sg.id
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
