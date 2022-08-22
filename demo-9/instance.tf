
resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group 
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

}

# ebs volme: gp2, 20G
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"

  tags = {
    Name = "extra volume data"
  }
}

# sudo -s
# df -h 
# mkfs.ext4 /dev/xvdh
# mkdir /data
# mount /dev/xvdh /data 
# df -h 
# vim /etc/fstab
# /dev/xvdh /data ext4 defaults 0 0 
# umount /data
# mount /data
# df -h 
# cat /etc/fstab
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name                    = "/dev/xvdh"
  volume_id                      = aws_ebs_volume.ebs-volume-1.id
  instance_id                    = aws_instance.example.id
  stop_instance_before_detaching = true
}
