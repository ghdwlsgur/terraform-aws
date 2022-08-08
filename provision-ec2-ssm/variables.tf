variable "instance_type" {
  type        = string
  description = "t2.micro"
  default     = "t2.micro"
}

variable "aws_region" {
  type        = string
  description = "Seoul"
  default     = "ap-northeast-2"
}

variable "volume_size" {
  type        = string
  description = "12GB"
  default     = "12"
}

variable "availability_zone" {
  type        = string
  description = "THE AZ to start the instance in"
  default     = "ap-northeast-2c"
}

variable "ec2_ami" {
  type        = string
  description = "ec2 image"
  default     = "ami-0cbec04a61be382d9"
}


