resource "aws_route53_record" "rc1" {
  zone_id = "Z00673132YFPQP22YSSFD"
  type    = "A"
  ttl     = 300
  name    = "script.destinyhairstyle.com"
  records = [ aws_lightsail_instance.server1.public_ip_address ]
}

