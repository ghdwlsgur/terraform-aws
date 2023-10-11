# ec2 이미지 검색 링크
# http://cloud-images.ubuntu.com/locator/ec2/

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0933d0fdfb094bfd1"
  instance_type = "t2.micro"
}

