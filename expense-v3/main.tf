resource "aws_instance" "instances" {
  count                   = length(var.components)
  ami                     = data.aws_ami.centos8.image_id
  instance_type           = var.instance_type
  vpc_security_group_ids  = var.vpc_security_group_ids

  tags = {
    Name = element(var.components, count.index)
  }
}

resource "aws_route53_record" "records" {
  count   = length(var.components)
  zone_id = var.zone_id
  name    = "${element(var.components, count.index)}-dev"
  type    = "A"
  ttl     = 30
  records = [element(aws_instance.instances.*.private_ip, count.index)]
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
