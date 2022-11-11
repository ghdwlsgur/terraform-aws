
// hosting zone name
resource "aws_route53_zone" "newtech-academy" {
  name = "newtech.academy"
}

// A - record
resource "aws_route53_record" "server1-record" {
  zone_id = aws_route53_zone.newtech-academy.zone_id
  name    = "server1.newtech.academy"
  type    = "A"
  ttl     = "300"
  records = ["100.236.247.8"]
}

// A - record
resource "aws_route53_record" "www-record" {
  zone_id = aws_route53_zone.newtech-academy.zone_id
  name    = "www.newtech.academy"
  type    = "A"
  ttl     = "300"
  records = ["104.236.247.8"]
}

// MX - record
resource "aws_route53_record" "mail1-record" {
  zone_id = aws_route53_zone.newtech-academy.zone_id
  name    = "newtech.academy"
  type    = "MX"
  ttl     = "300"
  records = [
    "1 aspmx.1.google.com.",
    "5 alt1.aspmx.1.google.com.",
    "5 alt2.aspmx.1.google.com.",
    "10 aspmx2.googlemail.com.",
    "10 aspmx3.googlemail.com."
  ]
}

output "ns-servers" {
  value = aws_route53_zone.newtech-academy.name_servers
}
