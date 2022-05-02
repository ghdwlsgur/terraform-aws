terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.5.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}


resource "aws_budgets_budget" "like-and-subscribe" {
  name              = "monthly-budget"
  budget_type       = "COST"
  limit_amount      = "500.0"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  time_period_start = "2022-05-01_00:01"
}
