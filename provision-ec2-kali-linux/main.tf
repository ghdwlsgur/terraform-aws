
provider "aws" {
  region = var.aws_region
}

resource "aws_default_subnet" "default" {
  availability_zone = var.availability_zone
}




