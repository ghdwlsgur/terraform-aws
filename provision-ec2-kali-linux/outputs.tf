// connect command
output "ssh_ec2_kali_linux_connect" {
  value = "ssh -v -i ~/.ssh/kali.pem -o IdentitiesOnly=yes kali@${aws_instance.kali_linux.public_ip}"
}


/* ! temp execute1

"terraform show -json | \
jq -r '.values.root_module.resources[].values | select(.private_key_pem) |.private_key_pem' \
> ~/.ssh/terraform_private_key.pem"

*/

