
data "aws_security_group" "default" {
  name = "default"
}

resource "aws_security_group" "linux_security" {
  name        = "linux_security"
  description = "linux_security"

  tags = {
    Name = "linux_security"
  }
}

resource "aws_security_group_rule" "inbound-ssh" {
  type              = "ingress"
  description       = "Allow 22 port from only my ip"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
  security_group_id = aws_security_group.linux_security.id
}

resource "aws_security_group_rule" "inbound-http" {
  type              = "ingress"
  description       = "Allow 80 to anywhere"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.linux_security.id
}

resource "aws_security_group_rule" "outbound" {
  type              = "egress"
  description       = "Allow to anywhere"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.linux_security.id
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
