resource "openstack_compute_instance_v2" "terraform-instance-01" {
  name     = "terraform-instance-01"
  region   = "KR1"
  key_pair = "centos-keypair"
}
