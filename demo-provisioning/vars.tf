# variable "AWS_ACCESS_KEY" {}
# variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "ap-northeast-2"
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

# Trouble shooting
# Failed to parse ssh private key: ssh: this private key is passphrase 
# ! 실행 
# ssh-keygen -t rsa -b 4096 

# 비밀키
variable "PATH_TO_PRIVATE_KEY" {
  default = "~/.ssh/id_rsa"
}

# 공개키 
variable "PATH_TO_PUBLIC_KEY" {
  default = "~/.ssh/id_rsa.pub"
}

# 우분투 
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
