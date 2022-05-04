variable "myvar" {
  type    = string
  default = "hello terraform"
}

variable "mymap" {
  type = map(string)
  default = {
    mykey = "my value"
  }
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-northeast-2 = "my ami"
  }
}

variable "mylist" {
  type    = list(any)
  default = [1, 2, 3]
}
