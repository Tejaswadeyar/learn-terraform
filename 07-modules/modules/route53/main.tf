resource "aws_route53_record" "records" {
  zone_id                 = "Z00984822ENLGYD99LZJY"
  name                    = "test"
  type                    = "A"
  ttl                     = 30
  #records                = [lookup(lookup(aws_instance.instances, each.key, null), "private_ip", null)]
  records                 = [ var.private_ip ]
}

variable "private_ip" {}