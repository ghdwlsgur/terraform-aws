terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.5.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

# budget 생성
# resource "aws_budgets_budget" "like-and-subscribe" {
#   name              = "monthly-budget"
#   budget_type       = "COST"
#   limit_amount      = "500.0"
#   limit_unit        = "USD"
#   time_unit         = "MONTHLY"
#   time_period_start = "2022-05-01_00:01"
# }

# 키페어 생성
resource "aws_key_pair" "web_admin" {
  key_name   = "web_admin"
  public_key = data.aws_ssm_parameter.secret.value
  # pem 저장
  provisioner "local-exec" {
    command = "echo '${aws_key_pair.web_admin.key_name}' > ~/redmax45/aws-key-pair/web_admin.pem"
  }
}

data "aws_ssm_parameter" "secret" {
  name = "/terraform/ssh-key"
}

# security group ssh 생성
resource "aws_security_group" "ssh" {
  name        = "allow_ssh_from_all"
  description = "Allow SSH port from all"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_security_group" "default" {
  name = "default"
}

# ec2 instance 생성
resource "aws_instance" "web" {
  ami           = "ami-0a93a08544874b3b7"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.web_admin.key_name
  vpc_security_group_ids = [
    aws_security_group.ssh.id,
    data.aws_security_group.default.id
  ]
}

resource "aws_db_instance" "web_db" {
  allocated_storage   = 8                                     # 할당할 용량 (기가바이트)
  engine              = "mysql"                               # 데이터베이스 엔진
  engine_version      = "8.0.28"                              # 데이터베이스 엔진 버전
  instance_class      = "db.t2.micro"                         # 인스턴스 타입
  username            = "admin"                               # 계정 이름
  password            = data.aws_ssm_parameter.password.value # 계정 비밀번호
  skip_final_snapshot = true
}

data "aws_ssm_parameter" "password" {
  name = "/terraform/rds-password"
}
