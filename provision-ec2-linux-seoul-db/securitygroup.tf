
data "aws_security_group" "default" {
  name = "default"
}

resource "aws_security_group" "linux_db_security" {
  name        = "linux_db_security"
  description = "linux_db_security"

  tags = {
    Name = "linux_db_security"
  }
}

resource "aws_security_group_rule" "inbound-ssh" {
  type              = "ingress"
  description       = "Allow 22 port from only my ip"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${chomp(data.http.myip.response_body)}/32"]
  security_group_id = aws_security_group.linux_db_security.id
}

resource "aws_security_group_rule" "inbound-http" {
  type              = "ingress"
  description       = "Allow 80 to anywhere"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.linux_db_security.id
}

resource "aws_security_group_rule" "inbound-icmp" {
  type              = "ingress"
  description       = "Allow icmp to web-server"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["172.31.43.234/32"]
  security_group_id = aws_security_group.linux_db_security.id
}

resource "aws_security_group_rule" "inbound-redis" {
  type              = "ingress"
  description       = "Allow 6379 to db"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  cidr_blocks       = ["172.31.43.234/32"]
  security_group_id = aws_security_group.linux_db_security.id
}

resource "aws_security_group_rule" "inbound-mysql" {
  type              = "ingress"
  description       = "Allow 3306 to web-server"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["172.31.43.234/32"]
  security_group_id = aws_security_group.linux_db_security.id
}

resource "aws_security_group_rule" "outbound" {
  type              = "egress"
  description       = "Allow to anywhere"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.linux_db_security.id
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
