resource "null_resource" "test" {
  count = 10
}


# By providing count , resource will become list

output "test" {
  value = null_resource.test.*.id
}


resource "aws_instance" "test" {
  count                   = 3
  ami                     = "mi-0f3c7d07486cad139"
  instance_type           = "t3.micro"
  vpc_security_group_ids  = ["sg-0107f6cbfc7566933"]

  tags = {
    Name = "frontend-dev"
  }
}
