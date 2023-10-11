data "aws_ip_ranges" "east_asia_ec2" {
  regions  = ["ap-northeast-2", "ap-northeast-3"]
  services = ["ec2"]
}

resource "aws_security_group" "from_seoul" {
  name = "from_seoul"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = slice(data.aws_ip_ranges.east_asia_ec2.cidr_blocks, 0, 9)
  }

  tags = {
    CreateData = data.aws_ip_ranges.east_asia_ec2.create_date
    SyncToken  = data.aws_ip_ranges.east_asia_ec2.sync_token
  }
}

output "cidr_blocks" {
  value = data.aws_ip_ranges.east_asia_ec2.cidr_blocks
}


