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

variable "subnet_id" {
  type        = string
  description = "The VPC subnet ID"
  default     = null
}

variable "availability_zone" {
  type        = string
  description = "The AZ to starrt the instance in"
  default     = "ap-northeast-2a"
}
