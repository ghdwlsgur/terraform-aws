
// NHN Cloud ID
// export TF_VAR_user_name=value
variable "user_name" {
  type        = string
  description = "INPUT VALUE - NHN Cloud ID"
}

// API 엔드포인트 설정
// export TF_VAR_tenant_id=value
variable "tenant_id" {
  type        = string
  description = "INPUT VALUE - API Endpoint [Tenant ID]"
}

// API 엔드포인트 설정
// export TF_VAR_password=value
variable "password" {
  type        = string
  description = "INPUT VALUE - API Endpoint [API 비밀번호]"
}

// API 엔드포인트 설정
// export TF_VAR_auth_url=value
variable "auth_url" {
  type        = string
  description = "INPUT VALUE - API Endpoint [identity]"
}

/*
NHN Cloud 리소스를 관리할 리전 정보를 입력합니다.
KR1 : 한국 (판교) 리전 
KR2 : 한국 (평촌) 리전 
JP1 : 일본 (도쿄) 리전
*/
// export TF_VAR_region=value
variable "region" {
  type        = string
  description = "INPUT VALUE - region"
}
