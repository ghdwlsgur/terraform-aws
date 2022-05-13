variable "AWS_REGION" {
  default = "ap-northeast-2"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "~/.ssh/id_rsa"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "~/.ssh/id_rsa.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-northeast-2 = "ami-0933d0fdfb094bfd1"
    us-east-1      = "ami-13be557e"
    us-west-2      = "ami-06b94666"
    eu-west-1      = "ami-844e0bf7"
  }
}
