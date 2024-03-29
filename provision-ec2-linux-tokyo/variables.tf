variable "instance_type" {
  type        = string
  description = "t2.micro"
  default     = "t2.micro"
}

variable "aws_region" {
  type        = string
  description = "Seoul"
  default     = "ap-northeast-1"
}

variable "volume_size" {
  type        = string
  description = "12GB"
  default     = "12"
}

variable "subnet_id" {
  type        = string
  description = "The VPC subnet ID"
  default     = null
}

variable "availability_zone" {
  type        = string
  description = "The AZ to start the instance in"
  default     = "ap-northeast-1a"
}

variable "ec2_ami" {
  type        = string
  description = "ec2 image"
  default     = "ami-0f36dcfcc94112ea1"
}

