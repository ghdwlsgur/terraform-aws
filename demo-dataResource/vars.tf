variable "AWS_REGION" {
  default = "ap-northeast-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-northeast-2 = "ami-0933d0fdfb094bfd1"
    us-east-1      = "ami-13b3557e"
  }
}
