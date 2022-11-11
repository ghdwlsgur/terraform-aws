#!/bin/bash
# Use this for your user date (script without newlines)
# install httpd (Linux 2 version)
# yum update -y
# yum install -y httpd.x86_64
# systemctl start httpd.service
# systemctl enable httpd.service
# echo "Hello World from $(hostname -f)" > /var/www/html/index.html

yum update -y 
sudo curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "session-manager-plugin.rpm"
sudo yum install -y session-manager-plugin.rpm

amazon-linux-extras install nginx1.12
nginx -v
systemctl start nginx
systemctl enable nginx 
chmod 2775 /usr/share/nginx/html
find /usr/share/nginx/html -type d -exec chmod 2775 {} \;
find /usr/share/nginx/html -type f -exec chmod 0664 {} \;
echo "<h3>This response is from $(hostname -f). Region: Seoul. Have a great Day</h3>" > /usr/share/nginx/html/index.html