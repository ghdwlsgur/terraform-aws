terraform {
  required_version = ">= 1.0.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.42.0"
    }
  }
}

provider "openstack" {
  user_name = var.user_name
  tenant_id = var.tenant_id
  password  = var.password
  auth_url  = var.auth_url
  region    = var.region
}
