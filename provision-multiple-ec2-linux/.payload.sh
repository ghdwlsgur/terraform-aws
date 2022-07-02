#!bin/bash
# Use this for your user date (script without newlines)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello World from $(hostname -f) : $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)" > /var/www/html/index.html