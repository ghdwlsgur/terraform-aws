output "ssh_private_key" {
  value     = tls_private_key.tls.private_key_pem
  sensitive = true
}

output "ssh_ec2_linux_connect" {
  value = "ssh -v -i ~/.ssh/linux2.pem -o IdentitiesOnly=yes ec2-user@${aws_instance.linux.public_ip}"
}
