terraform {
  backend "s3" {
    bucket = "terraform-state-temps3" #버킷이름
    key    = "terraform/demo"         #s3 내에서 저장되는 경로
    region = "ap-northeast-2"
  }
}


