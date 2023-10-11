
# data "aws_security_group" "default" {
#   name = "default"
# }

resource "aws_security_group" "endpoint_sg" {
  name        = "endpoint_sg"
  description = "endpoint_sg"

  tags = {
    Name = "endpoint_sg"
  }
}

resource "aws_security_group_rule" "inbound-https" {
  type              = "ingress"
  description       = "Allow 443 port from only my ip"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [var.vpc_cidr]
  security_group_id = aws_security_group.endpoint_sg.id
}

resource "aws_security_group_rule" "outbound" {
  type              = "egress"
  description       = "Allow to anywhere"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.endpoint_sg.id
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
