resource "null_resource" "test" {
  count = 10
}


# By providing count , resource will become list

output "test" {
  value = null_resource.test.*.id
}


#resource "aws_instance" "test" {
#  count                   = 3
#  ami                     = "ami-0f3c7d07486cad139"
#  instance_type           = "t3.micro"
#  vpc_security_group_ids  = ["sg-0107f6cbfc7566933"]
#
#  tags = {
#    Name = "test-${count.index}"
#  }
#}

variable "components" {
  default = [ "frontend", "backend", "mysql"]
}


resource "aws_instance" "test" {
  count                   = length(var.components)
  ami                     = "ami-0f3c7d07486cad139"
  instance_type           = "t3.micro"
  vpc_security_group_ids  = ["sg-0107f6cbfc7566933"]

  tags = {
    Name = element(var.components, count.index)
  }
}
