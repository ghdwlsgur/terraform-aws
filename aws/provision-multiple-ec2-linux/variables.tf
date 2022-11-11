variable "instance_type" {
  type        = string
  description = "t2.micro"
  default     = "t2.micro"
}

variable "aws_region" {
  type = string
  # description = "Seoul"
  description = "Singapore"
  # default     = "ap-northeast-2"
  default = "ap-southeast-1"

}

variable "volume_size" {
  type        = string
  description = "8GB"
  default     = "8"
}

# ! variable의 default에는 data값 들어갈 수 없다. 
# variable "subnet_id" {
#   type = string
#   # description = "The VPC subnet ID"
#   # default     = null
#   description = "public subnet"
#   default     = data.aws_ssm_parameter.secret.value
# }

variable "availability_zone" {
  type        = string
  description = "The AZ to start the instance in"
  # default     = "ap-northeast-2c"
  default = "ap-southeast-1a"
}

variable "ec2_ami" {
  type        = string
  description = "ec2 image"
  # default     = "ami-0cbec04a61be382d9"
  default = "ami-0c802847a7dd848c0"
}


