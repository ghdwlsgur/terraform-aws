variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "ENV" {
  default = "prod"
}

variable "linux_distro" {
  type    = string
  default = "ubuntu16"
}

variable "ami_id_filter" {
  type = map(string)

  default = {
    "ubuntu19" = "ubuntu/images/hvm-ssd/ubuntu-*-19.04-amd64-server-*;099720109477"
    "ubuntu18" = "ubuntu/images/hvm-ssd/ubuntu-*-18.04-amd64-server-*;099720109477"
    "ubuntu16" = "ubuntu/images/hvm-ssd/ubuntu-*-16.04-amd64-server-*;099720109477"
    "ubuntu14" = "ubuntu/images/hvm-ssd/ubuntu-*-14.04-amd64-server-*;099720109477"
    "debian9"  = "debian-stretch-*;379101102735"
    "debian8"  = "debian-jessie-*;379101102735"
    "centos7"  = "CentOS Linux 7*;679593333241"
    "centos6"  = "CentOS Linux 6*;679593333241"
    "rhel8"    = "RHEL-8.?*;309956199498"
    "rhel7"    = "RHEL-7.?*GA*;309956199498"
    "rhel6"    = "RHEL-6.?*GA*;309956199498"
  }
}
