resource "aws_instance" "instances" {
  for_each                = var.components
  ami                     = data.aws_ami.centos8.image_id
  instance_type           = lookup(each.value, "instance_type", "t2.micro")
  vpc_security_group_ids  = var.vpc_security_group_ids

  tags = {
    Name = lookup(each.value, "name", null )
  }
}

resource "aws_route53_record" "records" {
  for_each                = var.components
  zone_id                 = var.zone_id
  name                    = lookup(each.value, "name", null)
  type                    = "A"
  ttl                     = 30
  records                 = [lookup(lookup(aws_instance.instances, each.key, null), "private_ip", null)]
}












#resource "aws_instance" "backend" {
#  ami                     = data.aws_ami.centos8.image_id
#  instance_type           = var.instance_type
#  vpc_security_group_ids  = var.vpc_security_group_ids
#
#  tags = {
#    Name = "backend-dev"
#  }
#}
#
#resource "aws_route53_record" "backend" {
#  zone_id = var.zone_id
#  name    = "backend-dev"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.backend.private_ip]
#}
#
#
#
#resource "aws_instance" "mysql" {
#  ami                     = data.aws_ami.centos8.image_id
#  instance_type           = var.instance_type
#  vpc_security_group_ids  = var.vpc_security_group_ids
#
#  tags = {
#    Name = "mysql-dev"
#  }
#}
#
#resource "aws_route53_record" "mysql" {
#  zone_id = var.zone_id
#  name    = "mysql-dev"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.mysql.private_ip]
#}
#
#
##variable "ami" {
##  default = "ami-0f3c7d07486cad139"
##}ami-0f3c7d07486cad139
