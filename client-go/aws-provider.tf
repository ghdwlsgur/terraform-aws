provider "aws" {
  region = "us-east-2"
}

module "aws-network-configs" {
  source = "./network-configs"
}


