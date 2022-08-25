

resource "aws_vpc_endpoint" "logs" {
  vpc_id              = "vpc-0d45f4c15f9739f50"
  service_name        = "com.amazonaws.ap-northeast-2.logs"
  private_dns_enabled = true
  vpc_endpoint_type   = "Interface"
  security_group_ids = [
    aws_security_group.endpoint_sg.id
  ]
  tags = {
    Name = "logs"
  }
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id              = "vpc-0d45f4c15f9739f50"
  service_name        = "com.amazonaws.ap-northeast-2.ssm"
  private_dns_enabled = true
  vpc_endpoint_type   = "Interface"
  security_group_ids = [
    aws_security_group.endpoint_sg.id
  ]
  tags = {
    Name = "ssm"
  }
}

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id              = "vpc-0d45f4c15f9739f50"
  service_name        = "com.amazonaws.ap-northeast-2.ssmmessages"
  private_dns_enabled = true
  vpc_endpoint_type   = "Interface"
  security_group_ids = [
    aws_security_group.endpoint_sg.id
  ]
  tags = {
    Name = "ssmmessages"
  }
}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id              = "vpc-0d45f4c15f9739f50"
  service_name        = "com.amazonaws.ap-northeast-2.ec2messages"
  private_dns_enabled = true
  vpc_endpoint_type   = "Interface"
  security_group_ids = [
    aws_security_group.endpoint_sg.id
  ]
  tags = {
    Name = "ec2messages"
  }
}

