#variable "ami" {
#  default = "ami-0f3c7d07486cad139"
#}

#data resource is used (up)

variable "instance_type" {
  default = "t3.micro"
}


variable "vpc_security_group_ids" {
  default = ["sg-0107f6cbfc7566933"]
}
variable "zone_id" {
  default = "Z00984822ENLGYD99LZJY"
}