variable "components" {
  default = {
    frontend = {
      name          = "frontend"
      instance_type = "t3.micro"
    }
    backend = {
      #id backend person didnot mention instance type then it will take as t3.micro (see main code)
      name          = "backend"
    }
    mysql = {
      name          = "mysql"
      instance_type = "t3.small"
    }
  }
}

variable "zone_id" {
  default = "Z00984822ENLGYD99LZJY"
}

variable "vpc_security_group_ids" {
  default = ["sg-0107f6cbfc7566933"]
}