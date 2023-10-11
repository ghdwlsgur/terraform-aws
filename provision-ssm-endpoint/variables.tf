
variable "aws_region" {
  type        = string
  description = "AWS REGION - INPUT VALUE"
}

variable "subnet_id" {
  type        = string
  description = "SUBNET_ID OF INSTANCE - INPUT VALUE"
}

variable "vpc_id" {
  type        = string
  description = "VPC_ID OF INSTANCE - INPUT VALUE"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC'S CIDR BLOCK OF INSTANCE - INPUT VALUE"
}
